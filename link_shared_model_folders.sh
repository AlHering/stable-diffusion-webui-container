#!/bin/bash
#################################################
# Access point for linking model folders. Folder linking
# can be used at building-stage. Note that the
# folder and model structure follows own preferences.
#################################################

# stable diffusion model linker v0.4
if [ -z $1 ]
then 
    webui_model_dir="/stable-diffusion-webui-container/stable-diffusion-webui/models"
else 
    webui_model_dir=$1
fi


if [ -z $2 ]
then 
    central_sd_model_dir="/stable-diffusion-webui-container/machine_learning_models"
else 
    central_sd_model_dir=$2
fi


# create folders
MODEL_FOLDERS=("Stable-diffusion" "VAE" "Lora" "GFPGAN" "ESRGAN" "BLIP" "deepbooru" "torch_deepdanbooru" "Codeformer" "RealESRGAN" "ControlNet" "karlo" "hypernetworks" "LDSR" "SwinIR" "Poses" "embeddings" "LyCORIS")
echo $MODEL_FOLDERS
for FOLDER in "${MODEL_FOLDERS[@]}"
do  
    echo $FOLDER
    if [ ! -d "${webui_model_dir}/${FOLDER}" ]
    then
        mkdir "${webui_model_dir}/${FOLDER}"
    fi
done 


ln -sf ${central_sd_model_dir}/STABLE_DIFFUSION ${webui_model_dir}/Stable-diffusion
ln -sf ${central_sd_model_dir}/CHECKPOINTS ${webui_model_dir}/Stable-diffusion
ln -sf ${central_sd_model_dir}/VAE ${webui_model_dir}/VAE
ln -sf ${central_sd_model_dir}/LORA ${webui_model_dir}/Lora
ln -sf ${central_sd_model_dir}/GFPGAN ${webui_model_dir}/GFPGAN
ln -sf ${central_sd_model_dir}/ESRGAN ${webui_model_dir}/ESRGAN
ln -sf ${central_sd_model_dir}/BLIP ${webui_model_dir}/BLIP
ln -sf ${central_sd_model_dir}/DEEPBOORU ${webui_model_dir}/deepbooru
ln -sf ${central_sd_model_dir}/TORCH_DEEPDANBOORU ${webui_model_dir}/torch_deepdanbooru
ln -sf ${central_sd_model_dir}/CODEFORMER ${webui_model_dir}/Codeformer
ln -sf ${central_sd_model_dir}/REAL_ESRGAN ${webui_model_dir}/RealESRGAN
ln -sf ${central_sd_model_dir}/CONTROL_NET ${webui_model_dir}/ControlNet
ln -sf ${central_sd_model_dir}/KARLO ${webui_model_dir}/karlo
ln -sf ${central_sd_model_dir}/HYPERNETWORKS ${webui_model_dir}/hypernetworks
ln -sf ${central_sd_model_dir}/LDSR ${webui_model_dir}/LDSR
ln -sf ${central_sd_model_dir}/SWINIR ${webui_model_dir}/SwinIR
ln -sf ${central_sd_model_dir}/POSES ${webui_model_dir}/Poses
if [ ! -d "${webui_model_dir}/../embeddings" ]
then
    ln -sf ${central_sd_model_dir}/EMBEDDINGS ${webui_model_dir}/embeddings
    ln -sf ${central_sd_model_dir}/TEXTUAL_INVERSION ${webui_model_dir}/embeddings
else
    ln -sf ${central_sd_model_dir}/EMBEDDINGS ${webui_model_dir}/../embeddings
    ln -sf ${central_sd_model_dir}/TEXTUAL_INVERSION ${webui_model_dir}/../embeddings
fi
ln -s ${central_sd_model_dir}/LYCORIS ${webui_model_dir}/LyCORIS
#ln -s ${central_sd_model_dir}/WILDCARDS/ ${webui_model_dir}/
#ln -s ${central_sd_model_dir}/BSRGAN/ ${webui_model_dir}/

