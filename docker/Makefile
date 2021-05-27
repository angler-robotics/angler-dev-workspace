SHELL := /bin/bash

base:
	docker build -t aquadrone_latest -t aquadrone_base -f Dockerfile.Base ..

nvidia:
	echo "DISABLED; MAYBE UNUSED"
	# docker build -t aquadrone_latest -t aquadrone_nvidia -f Dockerfile.Nvidia --build-arg BASE_IMAGE=aquadrone_base ..

push:
	docker tag aquadrone_latest:latest waterlooaquadrone/aquadrone_dev_ws:latest
	docker push waterlooaquadrone/aquadrone_dev_ws:latest

pull:
	docker pull waterlooaquadrone/aquadrone_dev_ws:latest
	docker tag waterlooaquadrone/aquadrone_dev_ws:latest aquadrone_latest:latest
