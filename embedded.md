# Install Linux packages for ML on Embedded system
## Install anaconda

```
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh
sudo md5sum Miniconda3-latest-Linux-armv7l.sh
sudo /bin/bash Miniconda3-latest-Linux-armv7l.sh
```

Accept the license agreement with `yes`

When asked, change the install location: `/home/pi/miniconda3`

Do you wish the installer to prepend the Miniconda3 install location to PATH in your /root/.bashrc ? `yes`

Now add the install path to the PATH variable:
```
sudo nano /home/pi/.bashrc
```
Go to the end of the file .bashrc and add the following line:
```
export PATH="/home/pi/miniconda3/bin:$PATH"
```

```
## Install python
```
sudo apt-get install python3-dev libffi-dev libssl-dev -y
wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
tar xJf Python-3.6.3.tar.xz
cd Python-3.6.3
./configure
make
sudo make install
sudo pip3 install --upgrade pip
```
## test edgetpu
```
python3 python-tflite-source/edgetpu/demo/classify_image.py --model mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite  --label inat_bird_labels.txt --image parrot.jpg
```
