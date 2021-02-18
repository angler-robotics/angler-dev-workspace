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

Commands copied here for conveniance:
```
git clone https://github.com/jetsonhacks/rootOnNVMe.git
cd rootOnNVMe
./copy-rootfs-ssd.sh
./setup-service.sh
```

## Setting up Python 3.8
Install python 3.8 based on [this](https://ubuntuhandbook.org/index.php/2020/07/python-3-8-4-released-install-ubuntu-18-04-16-04/)  
WARNING: Do not set python3.8 as the default python3. Just don't.

Commands copied here for conveniance:
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.8
```

## Install pip
Workaround based on [this Stack Overflow question](https://stackoverflow.com/questions/63207385/how-do-i-install-pip-for-python-3-8-on-ubuntu-without-changing-any-defaults):
```
sudo apt install python3-pip
python3.8 -m pip instal pip
sudo apt remove python3-pip
```
We can now run Python 3.8 pip as follows:
```python3.8 -m pip --version```

## Setting up the codebase
```
cd ~
git clone https://github.com/Waterloo-Aquadrone/aquadrone2020jetson.git
cd aquadrone2020jetson/catkin_ws/src
git clone https://github.com/Waterloo-Aquadrone/aquadrone2020.git
cd aquadrone2020
python3.8 -m pip install -r pip_requirements.txt --upgrade
```
Note that we do not need to install ```uuv_simulator``` on the xavier board.

## Installing ROS and uuv_simulator
xSince we are forced to run Ubuntu 18.04, we can't use ROS Noetic. Instead, install ROS melodic and configure it to work with Python3 following [this guide](https://www.miguelalonsojr.com/blog/robotics/ros/python3/2019/08/20/ros-melodic-python-3-build.html).
xThe one caveat is replace ```~/ros_catkin_ws``` with ```~/aquadrone2020jetson/catkin_ws```
Based on this: http://wiki.ros.org/melodic/Installation/Ubuntu
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo rosdep init
rosdep update
sudo apt install ros-melodic-uuv-simulator
```

## .bashrc Setup
```
echo "" >> ~/.bashrc  
echo "# Aquadrone Setup" >> ~/.bashrc  
echo "source /usr/share/gazebo-11/setup.sh" >> ~/.bashrc  
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc  
echo "source ~/aquadrone2020_dev_workspace/catkin_ws/devel/setup.bash" >> ~/.bashrc  
echo "cd ~/aquadrone2020_dev_workspace/catkin_ws/src/aquadrone2020" >> ~/.bashrc  
echo "" >> ~/.bashr
```
