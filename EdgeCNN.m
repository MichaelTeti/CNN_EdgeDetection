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

im=rgb2gray(im2double(im));

x=im;

gene=[-.5 -1 -1 -1 -1 8 -1 -1 -1 -1 0 0 0 0 2 0 0 0 0];

z=gene(1);

b=reshape(gene(2:10), 3, 3);

a=reshape(gene(11:end), 3, 3);

init_im=0.*x;

dt=0.1

B0=conv2(init_im, b, 'same')

for iters=1:100

  dx=-im+conv2(f(x), a, 'same')+B0+Z;

  x=x+dx.*dt;

  
  subplot(1, 2, 1);
  imshow(im)
  subplot(1, 2, 2);
  imshow(x)

end;
        




function y=thresh(x)

y=(abs(x+1)/2 - abs(x-1)/2);
