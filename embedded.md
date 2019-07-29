# Setup Linux environment for ML on Embedded system

## Install tensorflow 1.14.0 with python 3.7
Download this folder and place it in `~/home` directory:
then: 
```
cd ~/Tensorflow-bin-master/
sudo apt-get install -y libhdf5-dev libc-ares-dev libeigen3-dev
sudo pip3 install keras_applications==1.0.7 --no-deps
sudo pip3 install keras_preprocessing==1.0.9 --no-deps
sudo pip3 install h5py==2.9.0
sudo apt-get install -y openmpi-bin libopenmpi-dev
sudo apt-get install -y libatlas-base-dev
pip3 install -U --user six wheel mock
sudo pip3 uninstall tensorflow
sudo pip3 install tensorflow-1.14.0-cp37-cp37m-linux_armv7l.whl
```

Follow this link to install edgetpu
https://blog.hackster.io/benchmarking-machine-learning-on-the-new-raspberry-pi-4-model-b-88db9304ce4

To install tensorflow 1.13.1:
```
wget https://www.piwheels.org/simple/tensorflow/tensorflow-1.13.1-cp37-none-linux_armv7l.whl
sudo pip3 install tensorflow*.whl
```
https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
## test edgetpu
```
python3 python-tflite-source/edgetpu/demo/classify_image.py --model mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite  --label inat_bird_labels.txt --image parrot.jpg
```
