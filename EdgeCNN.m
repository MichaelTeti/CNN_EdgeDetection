%Edge Detection Using Cellular Neural Network (CNN)
%Michael A. Teti
%FAU Machine Perception and Cognitive Robotics Lab
%5/1/16, version 1

%================================================================
%================================================================

clc;
clear all;
close all;

%load image

im=imread('image.jpg');
im=im2double(im);
gene=[-.5 -1 -1 -1 -1 8 -1 -1 -1 -1 0 0 0 0 2 0 0 0 0];
z=gene(1);
b=reshape(gene(2:10), 3, 3);
a=reshape(gene(11:end), 3, 3);
padside=im(:, 1, :);
padside2=im(:, end, :);
im=[padside im padside2];
padcol2=im(end, :, :);
padcol=im(1, :, :);
im=[padcol; im; padcol2];
init_im=im;
init_im(:, :, :)=255;
for i=2:size(im, 1)-1;
    for j=2:size(im, 2)-1;
        influence=im(i-1:i+1, j-1:j+1);
        input=influence.*b;
        feedback=influence.*
    end
end


