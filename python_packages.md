# Common python packages for ML/DS/CV
## Using pip - for HPC or docker
```
apt-get install -y libsm6 libxext6 libxrender-dev
pip3 install jupyter
pip3 install opencv-python 
pip3 install seaborn
pip3 install -U scikit-learn scipy matplotlib
```

## Using conda
Create conda environment:
Support minimum tensorflow lite interfaces
```
conda create --name ml jupyter tensorflow-gpu==1.13.1 python==3.6.2 h5py scikit-learn scipy matplotlib seaborn opencv
```
Install additional 
```
```
