#!/bin/bash
#########################################################
# Uncomment and change the variables below to your need:#
#########################################################

# Install directory without trailing slash
export install_dir="/stable-diffusion-webui-container"

# Name of the subdirectory
export clone_dir="stable-diffusion-webui"

# Commandline arguments for webui.py, for example: export COMMANDLINE_ARGS="--medvram --opt-split-attention"
#export COMMANDLINE_ARGS="--allow-code --xformers --device-id 0"
export COMMANDLINE_ARGS="--allow-code --skip-install --xformers --device-id 0"

# python3 executable
export python_cmd="python3"

# git executable
export GIT="git"

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
export venv_dir="/stable-diffusion-webui-container/venv"

# script to launch to start the app
#export LAUNCH_SCRIPT="launch.py"

# install command for torch
export TORCH_COMMAND="pip install torchvision==0.14.1 torchaudio==0.13.1 torch==1.13.1+cu117 --extra-index-url https://download.pytorch.org/whl/cu117"

# Requirements file to use for stable-diffusion-webui
#export REQS_FILE="requirements_versions.txt"

# Fixed git repos
#export K_DIFFUSION_PACKAGE=""
#export GFPGAN_PACKAGE=""

# Fixed git commits
#export STABLE_DIFFUSION_COMMIT_HASH=""
#export TAMING_TRANSFORMERS_COMMIT_HASH=""
#export CODEFORMER_COMMIT_HASH=""
#export BLIP_COMMIT_HASH=""

# Uncomment to enable accelerated launch
#export ACCELERATE="True"

###########################################
