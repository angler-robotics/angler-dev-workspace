SHELL := /bin/bash

base:
	docker build -t aquadrone_latest -t aquadrone_base -f Dockerfile.Base ..

nvidia:
	echo "DISABLED; MAYBE UNUSED"
	# docker build -t aquadrone_latest -t aquadrone_nvidia -f Dockerfile.Nvidia --build-arg BASE_IMAGE=aquadrone_base ..