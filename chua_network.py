import numpy as np
from scipy.misc import *
import cv2
import sys
from scipy.signal import convolve2d

def threshold(x):
  return np.absolute(x+1)/2 - np.absolute(x-1)/2

gene=np.array([-0.5, -1, -1, -1, -1, 8, -1, -1, -1, -1, 0, 0, 0, 0, 2, 0, 0, 0, 0])

class ChuaNetwork(object):
  ''' A software implementation of a cellular neural network invented by Leon Chua.

      Args:
           gene:        a vector with 19 elements, starting with the Z value, 
                        then the B filter, then the A filter. 

           input_image: a RGB or grayscale image.    

	   iterations:  number of desired iterations for the gene to operate
                        on the input_image. '''
              

  def __init__(self, input_image, gene, iterations):
    
    if len(input_image.shape)>2: 
      self.im=np.mean(input_image, axis=2)
    else:
      self.im=input_image
    self.network
    self.iters=iterations
    self.Z=gene[0]
    self.B=gene[1:10].reshape([3, 3])
    self.A=gene[10:].reshape([3, 3])

  
  def network(self): 
    self.im=(self.im-np.mean(self.im))/(np.std(self.im)+1e-6)
    print(self.im.shape)
    x0=0.0*self.im
    dt=0.1
    B0=convolve2d(x0, self.B, 'same')
    for iters in range(self.iters):
      dx=-self.im+convolve2d(threshold(self.im), self.A, 'same')+B0+self.Z
      self.im=self.im+dx*dt
      cv2.imshow('edge detector', self.im)
      cv2.waitKey(100)

data=np.load('cifar.npy')

img=np.reshape(data[20, :, :, :], [data.shape[1], data.shape[2], data.shape[3]])

CNN=ChuaNetwork(imresize(img, [300, 300]), gene, 30)
CNN.network()
