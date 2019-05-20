# Deep Learning Environment Set Up
## Target
Be able to train a Keras model on Jupyter Notebook with NVIDIA GPU

## Before we go
Below is just some helpful explanation for beginers, you can skip it to fast-forward

##### Why do we need Anaconda
Basicly you can install all the Python packages to do the training without anaconda. 
However, Anaconda is a useful tools to gather all the species for you.

##### What are CUDA and cuDNN?
I don't really know what they are. And I think we don't need to. 
CUDA on Window is like a NDIVIA driver you need to install to allow TensorFlow to control the GPU.
The cuDNN on the other hand contains some library files that you need to put into CUDA 
to make sure that they can talk to each other.
So if you are beginner like me, just install these to have your Keras model working

##### How they works to gether


##### My Machine configuration?
+ Model: DELL 7559
+ GPU: GTX 960M 
+ RAM: 16GB
+ SSD: 500GB
+ OS: WIndow 10 Home


## Let Do It Fast!
### 1. Install CUDA
Follow this NVIDIA official link, download and install it with default options:

    https://developer.nvidia.com/cuda-downloads
    
###### I downloaded CUDA v10 and it worked for me

### 2. Set up cuDNN 
Follow this NVIDIA official link to download cuDNN (login is needed and it is free!):

    https://developer.nvidia.com/rdp/cudnn-download

Depending on the version of CUDA you have installed, you need to select the the right version. 

###### I downloaded cuDNN v7.5.1. It should work with CUDA v10 without any problem

### 3. Install
Follow this link: select Window and download Anaconda installer for Window

    https://www.anaconda.com/distribution/#download-section
    
###### I download Python 3.7 version, but is should work with Python 2.7 version too
When you get to the Advance Options, you may want to select all options to make things easier. 
Otherwise, you may need to google around if you don't have administration privileges.

![anaconda](../images/anaconda.png)

