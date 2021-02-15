#

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