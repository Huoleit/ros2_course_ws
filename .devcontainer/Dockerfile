# syntax=docker/dockerfile:1

FROM rslethz/ros-course:latest

# Add productivity tools
COPY .devcontainer/install_fzf.bash /tmp/install_fzf.bash
RUN chmod +x /tmp/install_fzf.bash && /tmp/install_fzf.bash 0.58.0

# Add extra packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    mesa-utils \
    mesa-utils-extra \
    x11-utils \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*
