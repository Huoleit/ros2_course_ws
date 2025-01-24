# syntax=docker/dockerfile:1

FROM rslethz/ros-course:latest

# Add productivity tools
COPY install_fzf.bash /tmp/install_fzf.bash
RUN chmod +x /tmp/install_fzf.bash && /tmp/install_fzf.bash 0.58.0

####################################################
# Part below should be merged into the base image
####################################################
# Add mesa PPA
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    software-properties-common \
    mesa-utils \
    mesa-utils-extra \
    x11-utils \
    && rm -rf /var/lib/apt/lists/*

# Install latest mesa to fix the Gazebo warning in Ubuntu 24.04
RUN add-apt-repository ppa:kisak/kisak-mesa -y && apt-get update && apt-get -y upgrade

####################################################
# Part above should be merged into the base image
####################################################

# Add extra packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    x11-apps \
    vim \
    && rm -rf /var/lib/apt/lists/*
