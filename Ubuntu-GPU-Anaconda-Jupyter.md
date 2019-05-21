# Machine Learning - Ubuntu Environment Setup

## Target
Prepare the environment to train a Keras model on Jupyter Notebook with NVIDIA GPU on an Ubuntu machine

## Before we go

Here is the Q&A notes ([Link](Environment-QA.md)):
+ Container - docker?
+ Why do we need Anaconda?
+ What are CUDA and cuDNN?
+ What is Jupyter Notebook?
+ How do they works together?
+ My machine configuration?

## Now, Let's Do It Fast!
### 1. Install CUDA and cuDNN
+ Follow this NVIDIA official link, download and install it with default options:
```    
https://developer.nvidia.com/cuda-downloads
```
* To install:
```
sudo dpkg -i cuda-repo-*.deb
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub    
```
* To verify and mornitor GPU procees:
```
watch -n 1 nvidia-smi		
```

### 2. Setup Environment
Environment Options:
+ `Anaconda` - allow to create multiple environment
+ `Docker & Anaconda` - you will have less setup with the official NVIDIA docker image

#### 2.1 Install nvidia-docker
see more at https://github.com/NVIDIA/nvidia-docker/
+ Add the package repositories
```
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
```

+ Install nvidia-docker2 and reload the Docker daemon configuration
```
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd
```
+ pull docker image nvidia/tensorflow:19.04
```
docker pull nvcr.io/nvidia/tensorflow:19.04-py3
```

+ Test nvidia-smi with the latest official CUDA image
```
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi
```

+ Install common packages 
```
apt-get install sudo
apt-get install nano
apt-get install net-tool
apt-get update
sudo apt-get -y install python3-pip
pip install --upgrade pip
pip3 install jupyter
```
#### 2.2 Install CUDA Toolkit and cuDNN (skip this if you use NVIDIA docker)
+ Download and install:
```
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
chmod +x cuda_9.0.176_384.81_linux-run
sudo ./cuda_9.0.176_384.81_linux-run --override
```
+ While installation:
    + Select y for `Install on an unsupported configuration`
    + Select n for `Install NVIDIA Accelerated Graphics Drive`
    
+ Open .bashrc
```
nano ~/.bashrc
```
+ Add following:
```
# NVIDIA CUDA Toolkit
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64
```

+ Restart .bashrc
```
source ~/.bashrc
```

+ Test
```
nvcc -V
```

#### 2.3 Install Anaconda and ML packages
+ Follow this link: select Ubuntu and download Anaconda installer for Ubuntu
```
https://www.anaconda.com/distribution/#download-section
```
+ Extract the downloaded file and run the installation file: 
```
sudo ./Anaconda*.sh
```

#### 2.4 How to manage Anaconda environment
+ After you have installed Anaconda, you should be able to::
    + Create, clone, remove a selected environment
    + Apply different Python packages on a selected environment
+ Switch to base env
```
source ~/.bashrc
```
+ Create Anaconda environment `Fingers`
```
conda create --name Fingers python=3
```
###### For example, you can install 2 different python versions on two separate environment depending on the need of the projects

+ Active environment `Fingers`
```
	conda activate Fingers
```
+ Install common packages within `Fingers`
```
conda install tensorflow-gpu==1.12.0
conda install scikit-learn
conda install keras
conda install matplotlib
conda install seaborn
conda install pillow
```
+ Try this if you have environment issue
```
	conda install -c conda-forge jupyterlab
```

### 6. launch Jupyter Notebook
+ In Anaconda Navigator, install the latest version of Jupyter Notebook

+ After it finish, click on launch, it will add a new tab on your browser. 
You can now play around with the Jupyter on the default directory

+ However, it is also possible to change this default directory path:
    + On Anaconda Prompt, run `jupyter notebook --generate-config`
    + Open `C:\Users\username\.jupyter\jupyter_notebook_config.py`
    + Search for `c.NotebookApp.notebook_dir`, put your desired path there, uncomment that line

  