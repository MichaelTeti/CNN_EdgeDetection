%Edge Detection Using Cellular Neural Network (CNN)
%Michael A. Teti
%FAU Machine Perception and Cognitive Robotics Lab
%5/1/16, version 1

%================================================================
%================================================================

clc;
clear all;
close all;

%load data and initialize 

im=imread('image.jpg');
im=im2double(im);
gene=[-.5 -1 -1 -1 -1 8 -1 -1 -1 -1 0 0 0 0 2 0 0 0 0];
z=gene(1);
b=gene(2:10)';
a=gene(11:end)';
im=padarray(im, [1 1], 'replicate');
impatches=im2col(im, [3 3], 'sliding');
bcols=repmat(b, 1, size(impatches, 2));
acols=repmat(a, 1, size(impatches, 2));
