# Docker Setup

## For Ubuntu OS

### Docker Engine

Follow the install instructions here: `https://docs.docker.com/engine/install/ubuntu/`. You should have a docker version above 19.03 installed.

### NVidia

(From `https://docs.docker.com/config/containers/resource_constraints/`).

Follow the instructions from this page: `https://nvidia.github.io/nvidia-container-runtime/`

Then, run:
- `apt-get install nvidia-container-runtime`
- check that the following command succeeds with `which nvidia-container-runtime-hook`
- `sudo service docker restart`

## For Windows

### GUI Setup

To be able to view things through Docker (gazebo, etc), follow the setup here: https://jack-kawell.com/2019/09/11/setting-up-ros-in-windows-through-docker/


## Both OS's

### Creating the Docker Container

After the above, you can open a command line, navigate to the `docker` directory, and run the command `make` (if it's not available on Windows, copy the command in Makefile under `base:`).

### Running the Docker Container

Open a command line (bash (Ubuntu) or Powershell (Windows)) and navigate to the repo directory. `Run the start_docker_[OS].x` script. This should start a container. You can do this in additional terminals to connect to the same container as well.


# Testing Commands

For debugging issues in running containers, here are some commands you can use. Enter these from the command line.

1. `ping 8.8.8.8` can help test out the internet connection
2. `xeyes` can test out the gui connection of the container. You should see a pair of eyes following your mouse as it moves.
3. `glxgears` can test if the container can access your graphics card. This should fail on a Ubuntu computer without a GPU (probably), but may still work on a Windows machine, which may not support GPUS at at the moment.