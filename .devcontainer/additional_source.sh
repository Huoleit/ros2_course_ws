source_general() {
  local basename="$1"
  local ext

  if [ -n "$BASH_VERSION" ]; then
    ext=".bash"
  elif [ -n "$ZSH_VERSION" ]; then
    ext=".zsh"
  else
    echo "Unsupported shell"
    return 1
  fi

  local filepath="${basename}${ext}"

  if [ -f "$filepath" ]; then
    source "$filepath"
  else
    echo "File not found: $filepath"
    return 1
  fi
}

source_general /opt/ros/$ROS_DISTRO/setup
source_general $ROS_WORKSPACE_FOLDER/install/setup

# colcon-cd and colcon
source /usr/share/colcon_cd/function/colcon_cd.sh
source_general /usr/share/colcon_cd/function/colcon_cd-argcomplete
source_general /usr/share/colcon_argcomplete/hook/colcon-argcomplete

# ros argcomplete
source_general /opt/ros/$ROS_DISTRO/share/ros2cli/environment/ros2-argcomplete

# Add alias
alias wssetup="source ${ROS_WORKSPACE_FOLDER}/install/setup.bash"