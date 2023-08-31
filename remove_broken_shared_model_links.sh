#!/bin/bash
#################################################
# Script for removing broken links (models)
#################################################

# stable diffusion shared model broken link remover v0.1
if [ -z $1 ]
then 
    central_sd_model_dir="/stable-diffusion-webui-container/machine_learning_models"
else 
    central_sd_model_dir=$1
fi

find $central_sd_model_dir -xtype l -print -delete
