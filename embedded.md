# Setup Linux environment for ML on Embedded system

## Install tensorflow 1.13.1 with python 3.7

Execute below one by one:
```
sudo apt-get install -y python3-pip libhdf5-dev libc-ares-dev libeigen3-dev
sudo pip3 install keras_applications==1.0.7 --no-deps
sudo pip3 install keras_preprocessing==1.0.9 --no-deps
sudo apt-get install -y openmpi-bin libopenmpi-dev
sudo apt-get install -y libatlas-base-dev
pip3 install -U --user six wheel mock
sudo pip3 uninstall tensorflow
wget https://www.piwheels.org/simple/tensorflow/tensorflow-1.13.1-cp37-none-linux_armv7l.whl
sudo pip3 install tensorflow*.whl

```

## Install Open CV
https://www.pyimagesearch.com/2018/09/26/install-opencv-4-on-your-raspberry-pi/
```
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove -y

sudo apt-get update -y && sudo apt-get upgrade  -y

sudo apt-get install -y build-essential cmake unzip pkg-config

sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev

sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libcanberra-gtk*

sudo apt-get install -y libatlas-base-dev gfortran
```
Download opencv
```
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.0.0 opencv
mv opencv_contrib-4.0.0 opencv_contrib

```
Build opencv
```
cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D BUILD_EXAMPLES=OFF ..
```
Set `CONF_SWAPSIZE=2048` in:
```
sudo nano /etc/dphys-swapfile

```
Restart Swap:
```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
 Compile Opencv:
 ```
make -j4
sudo make install
sudo ldconfig
```
Set `CONF_SWAPSIZE=100` in:
```
sudo nano /etc/dphys-swapfile

```
Restart Swap:
```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
Create link to opencv
```
cd /usr/lib/python3/dist-packages/
sudo ln -s /usr/local/python/cv2/python-3.7/cv2.cpython-37m-arm-linux-gnueabihf.so cv2.so
```


Follow this link to install edgetpu
https://blog.hackster.io/benchmarking-machine-learning-on-the-new-raspberry-pi-4-model-b-88db9304ce4

## test edgetpu
```
python3 python-tflite-source/edgetpu/demo/classify_image.py --model mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite  --label inat_bird_labels.txt --image parrot.jpg
```
