# Install Linux packages for ML on Embedded system

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
test edgetpu
```
python3 python-tflite-source/edgetpu/demo/classify_image.py --model mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite  --label inat_bird_labels.txt --image parrot.jpg
```
