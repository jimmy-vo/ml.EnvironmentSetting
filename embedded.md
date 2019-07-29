# Setup Linux environment for ML on Embedded system

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
