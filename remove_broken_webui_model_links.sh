#!/bin/bash
#################################################
# Script for removing broken links (models)
#################################################

# stable diffusion webui model broken link remover v0.1
if [ -z $1 ]
then 
    webui_model_dir="/stable-diffusion-webui-container/stable-diffusion-webui/models"
else 
    webui_model_dir=$1
fi

find $webui_model_dir -xtype l -print -delete
