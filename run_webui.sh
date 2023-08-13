#!/bin/bash
#################################################
# Access point for starting the webui
# with standard commandline args
#################################################

cd "/stable-diffusion-webui-container/stable-diffusion-webui"
export COMMANDLINE_ARGS=${1:-"--allow-code --skip-install --xformers --device-id 0"}
bash webui.sh
