# Deep Learning - Window Environment Setup

## Target
Prepare the environment to train a Keras model on Jupyter Notebook with NVIDIA GPU on a Window machine

## Before we go

Here is the Q&A notes ([Link](Environment-QA.md)):
+ Container - docker?
+ Why do we need Anaconda?
+ What are CUDA and cuDNN?
+ What is Jupyter Notebook?
+ How do they works together?
+ My machine configuration?


## Now, Let's Do It Fast!
### 1. Install CUDA
+ Follow this NVIDIA official link, download and install it with default options:    
```
https://developer.nvidia.com/cuda-downloads
```
    
###### I downloaded CUDA v10.1 and it worked for me

### 2. Set up cuDNN 
+ Follow this NVIDIA official link to download cuDNN (login is needed and it is free!):
```
https://developer.nvidia.com/rdp/cudnn-download
```
+ Depending on the version of CUDA you have installed, you need to select the the right version. 
+ Unzip and copy all to CUDA folder: `C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.1`

###### I downloaded cuDNN v7.5.1. It should work with CUDA v10 without any problem

### 3. Install Anaconda
+ Follow this link: select Window and download Anaconda installer for Window
```
https://www.anaconda.com/distribution/#download-section
```
###### I download Python 3.7 version, but is should work with Python 2.7 version too
+ When you get to the Advance Options, you may want to select all options to make things easier. 
Otherwise, you may need to google around if you don't have administration privileges.

<div style='float: center'>
  <img style='width: 600px' src="../../blob/master/images/conda_install.png"></img>
</div>

### 4. How to manage Anaconda environment
+ After you have installed Anaconda, you should be able to launch Anaconda Navigator

+ In Environment Tab, you can manage your own environment:
    + Create, clone, remove a selected environment
    + Apply different Python packages on a selected environment

<div style='float: center'>
  <img style='width: 600px' src="../../blob/master/images/conda_env.png"></img>
</div>

###### For example, you can install 2 different python versions on two separate environment depending on the need of the projects
+ For now, let's create your own environment `(Fingers)` and move to the next step


### 5. Install packages on an Anaconda environment
+ Launch Anaconda Prompt as below

<div style='float: center'>
  <img style='width: 600px' src="../../blob/master/images/conda_pkg.png"></img>
</div>

+ On Anaconda Prompt, you will see something like `(Fingers)`, which indicates that the session is currently 
within the Fingers environment.
Next, execute the following command to install the common packages
```
conda install tensorflow-gpu==1.12.0
conda install scikit-learn
conda install keras
conda install matplotlib
conda install seaborn
conda install pillow
```
* For each of the package, search the package name in Environment Tab of Anaconda Navigator. 
Make sure that it is applied to the selected environment as below:

<div style='float: center'>
  <img style='width: 600px' src="../../blob/master/images/conda_applypkg.png"></img>
</div>


### 6. Install and launch Jupyter Notebook
+ In Anaconda Navigator, install the latest version of Jupyter Notebook

+ After it finish, click on launch, it will add a new tab on your browser. 
You can now play around with the Jupyter on the default directory

+ However, it is also possible to change this default directory path:
    + On Anaconda Prompt, run `jupyter notebook --generate-config`
    + Open `C:\Users\username\.jupyter\jupyter_notebook_config.py`
    + Search for `c.NotebookApp.notebook_dir`, put your desired path there, uncomment that line
    
### 7. Verify your environment
+ Create a new jupyter notebook
+ In the first cell, insert:

```
import os
import sys    
import time
from keras.preprocessing.image import ImageDataGenerator
import tensorflow as tf
import numpy as np
from sklearn.metrics import confusion_matrix
import seaborn as sn
from auto_train import core_train 
%matplotlib inline
import matplotlib
import matplotlib.pyplot as plt
from keras.layers import Conv2D, MaxPooling2D, Dropout, Dense, Flatten
from keras.callbacks import EarlyStopping, ModelCheckpoint, TensorBoard
from keras.models import Sequential
import tensorflow as tf

if tf.test.is_gpu_available():
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    sess = tf.Session(config=config)
    print('GPU is ready for tensorflow') 
```  
        
+ Run that cell, you should be able to see `GPU is ready for tensorflow` without any error. 
But if you see error, google!!! I am sure that you will figure it out!

    
    
  