FROM ros:melodic-perception-bionic

ENV ROS_DISTRO=melodic
RUN apt-get update && apt-get install -y \
    python-catkin-tools 
    # ros-${ROS_DISTRO}-image-transport \
    # ros-${ROS_DISTRO}-cv-bridge

RUN apt-get install -y \
    libusb-1.0-0-dev

RUN apt-get update && apt-get install -y \
    vim \
    dbus \
    dbus-x11 \
    terminator

#Add new sudo user
ENV USERNAME flir
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME
WORKDIR /home/$USERNAME