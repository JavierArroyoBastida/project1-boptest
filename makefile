IMG_NAME=boptest_${TESTCASE}

COMMAND_RUN=docker run \
	  --name ${IMG_NAME} \
	  --rm \
 	  -it \
	  -p 127.0.0.1:5000:5000
	  
COMMAND_RUN_RC=docker run \
	  --name ${IMG_NAME} \
	  --rm \
 	  -it \
	  -p 127.0.0.1:8080:5000

build:
	docker build --build-arg testcase=${TESTCASE} --no-cache --rm -t ${IMG_NAME} .

remove-image:
	docker rmi ${IMG_NAME}

run:
	$(COMMAND_RUN) --detach=false ${IMG_NAME} /bin/bash -c "python restapi.py && bash"

run-detached:
	$(COMMAND_RUN) --detach=true ${IMG_NAME} /bin/bash -c "python restapi.py && bash"

run-RC:
	$(COMMAND_RUN_RC) --detach=false ${IMG_NAME} /bin/bash -c "python restapi.py && bash"

run-detached-RC:
	$(COMMAND_RUN_RC) --detach=true ${IMG_NAME} /bin/bash -c "python restapi.py && bash"

stop:
	docker stop ${IMG_NAME}
