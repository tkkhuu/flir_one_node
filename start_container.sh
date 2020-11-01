XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
CONTAINER_USER=flir

mkdir -p shared_dir/ros_ws/src

docker run -it \
           --rm \
           --gpus all \
           --volume=$XSOCK:$XSOCK:rw \
           --volume=$XAUTH:$XAUTH:rw \
           --env="XAUTHORITY=${XAUTH}" \
           --env="DISPLAY" \
           --user=$CONTAINER_USER \
           --volume=`pwd`/shared_dir:/home/$CONTAINER_USER/shared_dir \
           --volume=`pwd`/flir_one_node:/home/$CONTAINER_USER/shared_dir/ros_ws/src/flir_one_node \
           flir_driver