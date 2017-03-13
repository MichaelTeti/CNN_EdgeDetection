# Cellular Nonlinear Network
A software implementation of the cellular nonlinear network (CNN) developed by Leon Chua.  

## Background
- [Leon Chua's HP Lectures](https://www.youtube.com/watch?v=I1rLjjjjbbE&index=6&list=PLtS6YX0YOX4eAQ6IrOZSta3xjRXzpcXyi) - I highly recommend this set of lectures. He goes over biology, complexity, chaos, and a very important emerging technology for ML that he first theorized, memristors. 

### Network Dynamics
![alt tag](https://github.com/MichaelTeti/CNN_EdgeDetection/blob/master/CNN_Structure.jpg)


As can be seen in the figure above, this is a dynamic system, not a mere lookup table. In the CNN paradigm, a 19-number gene is given as the template for what the network will do to the image. A simple Matlab code can be seen [here](https://github.com/MichaelTeti/CNN_EdgeDetection/blob/master/EdgeCNN.m), and a python version is [here](https://github.com/MichaelTeti/CNN_EdgeDetection/blob/master/chua_network.py) if you want to follow along. In the python version, the network exists as an object that we can send the image and gene to.  
  
In the CNN paradigm, the gene is based on biology, where a gene determines what molecules are made and much of how the system will behave and develop. The first number, Z, is essentially the bias. The 2nd through the 10th numbers in the gene, B, can be reshaped into a 3 x 3 input weight convolution. The 11th through 19th number is comprises the 3 x 3 inhibitory weight convolution, A. Over time, the network settles of a value for each pixel. Upon receiving an input image, pixel *i*, *j*'s activation is determined by multiplying the outputs from all of the pixel's nearest neighbors by A (i.e. inhibition), adding the product of B and the input, and adding Z. The result is then sent through some activation function and goes through these steps for a certain number of iterations.

## Code and Methods
We first initialize the gene we want.  
>gene=[-.5 -1 -1 -1 -1 8 -1 -1 -1 -1 0 0 0 0 2 0 0 0 0];  
  
Given the gene, we then create the bias Z, the input weights B, and the inhibitory weights A.  
z=gene(1);  
b=reshape(gene(2:10), 3, 3);  
a=reshape(gene(11:end), 3, 3);  
  
We initialize the input with zeros. 
>init_im=0.*x;  
>b=conv2(init_im, b, 'same');  
  
The network consists of the following lines:  
>dx=-im+conv2(f(x), a, 'same')+b+z;  
>x=x+dx.*dt;  

where f(x) is the activation function.

The system is then run for a number of iterations and it settles down on a certain state. 

## Results
These are the results obtained with a gene designed to detect edges.  
![alt tag](https://github.com/MichaelTeti/CNN_EdgeDetection/blob/master/cnnedgecircle.png)
![alt tag](https://github.com/MichaelTeti/CNN_EdgeDetection/blob/master/edgecnnlena.png)
