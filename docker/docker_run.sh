PWD=`pwd`

docker run -it --rm \
	--user rosnoetic \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    	--volume=${PWD}/src:/home/catkin_ws/src \
	ros-noetic-rootless \
	bash
