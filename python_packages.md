# Common python packages for ML/DS/CV
## Using pip - for HPC or docker
```
apt-get install -y libsm6 libxext6 libxrender-dev sudo
pip3 install jupyter
pip3 install -U scikit-learn scipy matplotlib opencv-python seaborn
```

## Using conda
Create conda environment:
Support minimum tensorflow lite interfaces
```
conda create --name ml jupyter tensorflow-gpu==1.13.1 python==3.6.8 h5py scikit-learn scipy matplotlib seaborn
```
Install additional 
```
conda install -c menpo opencv=2.4.11
```
