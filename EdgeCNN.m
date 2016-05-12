%Edge Detection Using Cellular Neural Network (CNN)
%Michael A. Teti
%FAU Machine Perception and Cognitive Robotics Lab
%5/11/16, version 1

%================================================================
%================================================================

clc;
clear all;
close all;

%load image

im=imread('image2.jpg');
im=im2double(im);
im=rgb2gray(im);
gene=[-.5 -1 -1 -1 -1 8 -1 -1 -1 -1 0 0 0 0 2 0 0 0 0];
z=gene(1);
b=reshape(gene(2:10), 3, 3);
a=reshape(gene(11:end), 3, 3);
%im=im(1:3:end, 1:3:end);
im=[im(:, 1) im im(:, end)];
im=[im(1, :); im; im(end, :)];
init_im=im;
init_im(:, :)=0;
prod=zeros(size(im));
iter=0;
while iter < 1
    for i=2:size(im, 1)-1;
        for j=2:size(im, 2)-1;
            influence=im(i-1:i+1, j-1:j+1);
            prod(i, j)=init_im(i, j)+z+(sum(sum(influence.*b)));
            out=(exp(prod(i, j))-exp(-prod(i, j)))/(exp(prod(i, j))+exp(-prod(i, j)));
            prod(i, j)=prod(i, j)+out*a(2, 2);
            init_im(i, j)=prod(i, j);
        end
    end 
    iter=iter+1;
end 

subplot(1, 2, 1);
imshow(im)
subplot(1, 2, 2);
imshow(prod)
        
