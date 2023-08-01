# Set $ROOT to top-level directory of the repository
ROOT ?= $(shell dirname \
  $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST)))))

IMG_NAME=boptestweb
IMG_HOME=/home

build:
	docker build -f Dockerfileweb \
	--platform=linux/amd64 \
	--progress=plain --rm -t ${IMG_NAME} ../

build-no-cache:
	docker build -f Dockerfileweb \
	--platform=linux/amd64 \
	--no-cache \
	--progress=plain --rm -t ${IMG_NAME} ../

run:
	docker run \
		--name ${IMG_NAME} \
		--platform=linux/amd64 \
		--detach=false \
		--network=host \
		--rm \
		-v ${ROOT}:${IMG_HOME}/boptest:rw \
		-w ${IMG_HOME}/boptest/web \
		-it \
		${IMG_NAME} /bin/bash

#--platform=linux/amd64 \

# docker run -it -v /path/to/your/host/gem/directory:/usr/local/bundle image_name

# Replace /path/to/your/host/gem/directory with the path to a directory on your host system where you want to store the installed gems. /usr/local/bundle is the default location where gems are installed in the container.
# By using this volume mount, the gems installed in the container will be stored on your host system. Therefore, when you stop or remove the container and then run it again, the gems will still be available in the directory mounted from the host.


