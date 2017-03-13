%Edge Detection Using Cellular Neural Network (CNN)
%Michael A. Teti
%FAU Machine Perception and Cognitive Robotics Lab
%5/11/16, version 1

%================================================================
%================================================================

function MPCR_CellNN()

x=im2double(rgb2gray(imread('road.jpg')));

imshow(x);
colormap gray
pause

uu = (max(max(x)));
ul = (min(min(x)));
x = (x-ul)/(uu-ul)*2-1;


% x0=x;
x0=0.*x;

A=[0 0 0;0 2 0;0 0 0];
B=[-1 -1 -1;-1 8 -1;-1 -1 -1];
Z=-0.5;

dt = 0.1;

B0=conv2(x0,B,'same');

for j=1:1000
    
    
    dx = -x + conv2(f(x),A,'same') + B0 + Z ;
    
    x=x+dx.*dt;
        
    image((f(x)+1)*50); 
    pause(.25)
    drawnow
    
    
end;





function y = f(x)

y=(abs(x+1)/2 - abs(x-1)/2);
