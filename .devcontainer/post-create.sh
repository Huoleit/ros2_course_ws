#!/bin/bash
ROOT=$(dirname "$(dirname "$(readlink -f $0)")")

# Store command history in the workspace which is persistent across rebuilds
echo "export HISTFILE='${ROOT}/.zsh_history'" >> ~/.zshrc
echo "export HISTFILE='${ROOT}/.bash_history'" >> ~/.bashrc
# Bash only save history on exit - this will save history on each command
echo "export PROMPT_COMMAND='history -a'" >> ~/.bashrc

# use in '.devcontainer/additional_source.sh' to source the workspace setup files
echo "export ROS_WORKSPACE_FOLDER=${ROOT}" >> ~/.bashrc
echo "export ROS_WORKSPACE_FOLDER=${ROOT}" >> ~/.zshrc

# Setup fzf completions
echo "eval \"\$(fzf --bash)\"" >> ~/.bashrc
echo "source <(fzf --zsh)" >> ~/.zshrc

# Source additional source file - Modification in '.devcontainer/additional_source.sh' takes effect without rebuilding the container
echo "source ${ROOT}/.devcontainer/additional_source.sh" >> ~/.bashrc
echo "source ${ROOT}/.devcontainer/additional_source.sh" >> ~/.zshrc
