# Machine Learning - Environment QA
Below is just some helpful explanation for beginners, you can skip it to fast-forward

##### Why do we need Anaconda?
Basically you can install all the Python packages to do the training without anaconda. 
However, Anaconda is a useful tools to gather all the species for you.
It also allows the ability of isolating the environment of different project so that they don't mess up each other

##### What are CUDA and cuDNN?
I don't really know what they are. And I think we don't need to. 
CUDA on Window is like a NVIDIA driver you need to install to allow TensorFlow to control the GPU.
The cuDNN on the other hand contains some library files that you need to put into CUDA 
to make sure that they can talk to each other.
So if you are beginner like me, just install these to have your Keras model working

##### What is Jupyter Notebook?
It's is a web-based visualizing tool that allows you to execute Python script

##### How do they works together?
Keras sits on top of Anaconda environment where you can install python dependencies like TensorFlow.
Jupyter also sits on top of Anaconda environment. 
CUDA and cuDNN are the low-level stuff on top of Window (again, you don't need to worry to much a bout those)

##### My machine configuration?
+ Model: DELL 7559
+ GPU: GTX 960M 
+ RAM: 16GB
+ SSD: 500GB
+ OS: Window 10 Home