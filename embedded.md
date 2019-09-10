# Setup Linux environment for ML on Embedded system


## Update
```
sudo apt-get update
sudo apt-get upgrade
sudo rpi-update
sudo apt-get install git

```
## Install tensorflow 1.13.1 with python 3.7

Execute below one by one:
```
mkdir Download
cd Download

sudo apt-get -y install python3-pip
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
sudo apt-get install -y build-essential cmake unzip pkg-config

```
sudo apt-get purge wolfram-engine
sudo apt-get purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove -y

sudo apt-get update -y && sudo apt-get upgrade  -y
sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libcanberra-gtk* libatlas-base-dev gfortran
```
## Cmake
note: better to install 3.13.4 or you will need to solve later problem with this https://zhuanlan.zhihu.com/p/38738976
```
cd Download
sudo apt-get install -y  libcurl4-gnutls-dev zlib1g-dev

wget https://cmake.org/files/v3.15/cmake-3.15.0.tar.gz
tar -xvzf cmake-3.15.0.tar.gz
cd cmake-3.15.0/
sudo ./bootstrap
sudo make
sudo make install
```

## Download opencv
```
cd ~/Download
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.0.0 ~/opencv
mv opencv_contrib-4.0.0 ~/opencv_contrib

```
## Build opencv
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

## Install EdgeTPU package
This is prepared based on [this tutorial](https://blog.hackster.io/benchmarking-machine-learning-on-the-new-raspberry-pi-4-model-b-88db9304ce4)
Download the prepared files from [here](https://github.com/jimmyvo2410/ml.EnvironmentSetting/tree/master/python-tflite-source), place it in `~/` directory.
Then:
```
cd ~/python-tflite-source/

```
And then: recommend to choose N when being ask for maximum operating frequency
```
sudo ./install.sh
```

## Install other packages
```
sudo pip3 install image
sudo apt-get install python3-picamera -y
sudo apt-get install --no-install-recommends xserver-xorg -y
sudo apt-get install --no-install-recommends raspberrypi-ui-mods lxterminal gvfs -y
```

```
pip3 install SpeechRecognition
pip3 install paho-mqtt
sudo apt-get install python-pyaudio python3-pyaudio
pip3 install ttspico
pip3 install spidev gpiozero
sudo apt install -y mosquitto mosquitto-clients


```
## Respeaker
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install flac
git clone https://github.com/respeaker/seeed-voicecard.git
cd seeed-voicecard
sudo ./install.sh

git clone https://github.com/respeaker/4mics_hat.git
cd /home/pi/4mics_hat
```
## Backup sdcard
Check to make sure sdcard is mounted on /dev/sdb
To backup
```
sudo dd if=/dev/sdb of=~/SDCardBackup.img
```
To restore
```
sudo umount /dev/sdb1
sudo umount /dev/sdb2
sudo dd bs=4M if=~/SDCardBackup.img of=/dev/sdb
```
