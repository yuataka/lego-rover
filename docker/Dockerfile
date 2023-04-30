FROM ubuntu:20.04

ARG USERNAME=user-name-goes-here
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install dependencies
RUN apt-get update && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl gnupg lsb-release && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ros-noetic-desktop && \
    apt-get install -y python3-colcon-common-extensions && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME


# Set up environment
WORKDIR /home/catkin_ws
RUN echo "source /opt/ros/noetic/setup.bash" >> .bashrc

CMD ["/bin/bash"]
