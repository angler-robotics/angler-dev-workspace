#!/bin/bash
echo "Sourcing bashrc via $SHELL and $0"
source /opt/ros/noetic/setup.bash  || true
source /home/aquadrone/catkin_ws/devel/setup.bash  || true

alias killros='killall -9 gazebo & killall -9 gzserver  & killall -9 gzclient & killall -9 roslaunch & killall -9 roscore & killall -9 rosmaster & killall -9 rviz'

echo "bashrc sourced"
echo "Good to go"