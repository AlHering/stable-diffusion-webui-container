#!/bin/bash
#################################################
# Access point for starting the webui
# with standard commandline args
#################################################

cd "/stable-diffusion-webui-container/stable-diffusion-webui"
source "/stable-diffusion-webui-container/venv/bin/activate"
pip install --no-cache-dir torchvision==0.15.2+cu117 torchaudio==2.0.2+cu117 torch==2.0.1+cu117 xformers==0.0.20 --extra-index-url https://download.pytorch.org/whl/cu117
pip install --no-cache-dir --upgrade pytorch_lightning==1.7.7 torchmetrics==0.11.4 git+https://github.com/openai/CLIP.git 
pip install --no-cache-dir -r requirements.txt
export COMMANDLINE_ARGS=${1:-"--allow-code --skip-torch-cuda-test --xformers --exit"}
bash webui.sh
