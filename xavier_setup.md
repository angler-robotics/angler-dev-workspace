## Setting up the board
Flash SD card with .img file from [here](https://developer.nvidia.com/jetson-nx-developer-kit-sd-card-image) (need an account)  
You can use [this program](https://meet.google.com/izx-cyvt-wit) to flash the SD card.
The Jetson Xavier only supports Ubuntu 18.04, partly because Ubuntu 20.04 does not yet support CUDA.

Account settings:  
Name: Aquadrone  
Computer Name: aquadrone-xavier  
username: aquadrone  
password: aquadrone  
log in automatically  
APP Partition Size: maximum  
Nvpmodel mode: 15W 6 core  

## Setting up booting from the SSD
Set up boot from ssd based on [this video](https://www.youtube.com/watch?v=ZK5FYhoJqIg)  
You can delete the rootOnNVMe folder on the SSD after restarting. The files on the SD card are still availible under /media/aquadrone and should be left alone.

## Setting up Python 3.8
Install python 3.8 and set it as the default python3 based on [this](https://ubuntuhandbook.org/index.php/2020/07/python-3-8-4-released-install-ubuntu-18-04-16-04/)  
```sudo apt install python3-pip```

## Setting up the codebase
```
cd ~
git clone https://github.com/Waterloo-Aquadrone/aquadrone2020jetson.git
cd aquadrone2020jetson/catkin_ws/src
git clone https://github.com/Waterloo-Aquadrone/aquadrone2020.git
cd aquadrone2020
pip3 install -r pip_requirements.txt --upgrade
```
Note that we do not need to install ```uuv_simulator``` on the xavier board.

## Installing ROS
Since we are forced to run Ubuntu 18.04, we can't use ROS Noetic. Instead, install ROS melodic and configure it to work with Python3 following [this guide](https://www.miguelalonsojr.com/blog/robotics/ros/python3/2019/08/20/ros-melodic-python-3-build.html).
The one caveat is replace ```~/ros_catkin_ws``` with ```~/aquadrone2020jetson/catkin_ws```
