# IMPORTANT NOTES
- this repo is a highly customized fork of AUTOMATIC1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui/) 
- this repo is strongly geared towards personal infrastructure preferences and experiments and thus not meant for public use (yet)
    - this includes the chosen extensions and the mounting and linking concept in special
- this repo is work in process
- this repo focusses on support for linux and uses 


## Used Repositories/Code
| Name         | Link     | commit |
|--------------|-----------|------------|
| AUTOMATIC1111's Stable Diffusion WebUI |  https://github.com/AUTOMATIC1111/stable-diffusion-webui/    |   68f336b     |
| a1111-sd-webui-lycoris |   https://github.com/KohakuBlueleaf/a1111-sd-webui-lycoris.git   |    ce584a0f    |
| a1111-sd-webui-tagcomplete |  https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git    |    3b51035c    |
| canvas-zoom |   https://github.com/richrobber2/canvas-zoom.git   |    72b90783    |
| clip-interrogator-ext |   https://github.com/pharmapsychotic/clip-interrogator-ext.git   |    9e6bbd9b    |
| ebsynth_utility |   https://github.com/s9roll7/ebsynth_utility.git   |   c255e64a     |
| gif2gif |   https://github.com/LonicaMewinsky/gif2gif.git   |   cc164474     |
| openpose-editor |  https://github.com/fkunn1326/openpose-editor.git     |    0b10737e    |
| posex |   https://github.com/hnmr293/posex.git   |    61169d30    |
| sd-canvas-editor |  https://github.com/jtydhr88/sd-canvas-editor.git    |   4f3ffe4a     |
| sd-webui-3d-open-pose-editor |  https://github.com/nonnonstop/sd-webui-3d-open-pose-editor.git    |    f2d5aac5    |
| sd-webui-aspect-ratio-helper |  https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git    |    b03cce20    |
| sd-webui-controlnet |   https://github.com/Mikubill/sd-webui-controlnet.git    |    cfc37659    |
| sd-webui-model-converter |   https://github.com/Akegarasu/sd-webui-model-converter.git   |    d19e2816    |
| sd_dreambooth_extension |  https://github.com/d8ahazard/sd_dreambooth_extension.git    |   926ae204     |
| sd_save_intermediate_images |   https://github.com/AlUlkesh/sd_save_intermediate_images.git   |    8115a847    |
| stable-diffusion-webui-composable-lora |   https://github.com/opparco/stable-diffusion-webui-composable-lora.git   |    d4963e48    |
| stable-diffusion-webui-dataset-tag-editor |  https://github.com/toshiaki1729/stable-diffusion-webui-dataset-tag-editor.git    |    344fd995    |
| stable-diffusion-webui-images-browser |  https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git    |   84cb6174     |
| stable-diffusion-webui-rembg |  https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg.git    |    64821f04    |
| stable-diffusion-webui-state |   https://github.com/ilian6806/stable-diffusion-webui-state.git   |    4cc8fa3c    |
| stable-diffusion-webui-two-shot |   https://github.com/ashen-sensored/stable-diffusion-webui-two-shot.git   |   6b55dd52     |
| ultimate-upscale-for-automatic1111 |   https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git   |   d002fdfc     |

## Installation
### 1. Install Docker

```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
(https://docs.docker.com/engine/install/ubuntu/)

### 2. Install the NVIDIA-Docker-Runtime
The NVIDIA-Docker-Runtime needs to be installed.
```sh
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
    && curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2 nvidia-container-runtime

sudo systemctl restart docker
```
(https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

### 3. Clone or download and unpack this repository

After cloning or downloading and unpacking, you might want to add to or adjust the code. Examples might be `install_extensions.py` or `link_shared_model_folders.sh`.
The second script is later used for linking the model folders which will be mounted to `stable-diffusion-webui-container/machine_learning_models` into the webui model folder at `stable-diffusion-webui-container/stable-diffusion-webui/models`. You can, however, ignore this file and later mount your local model folder directly to the target model folder. Be aware that - depending on the model folder structure - the webui might download default models, if they are not already available under their intended path.

### 4. Build a Docker image from the repository
```sh
nvidia-docker build -t stable-diffusion-webui-container:v1.5.1_extensions <path to repo folder>
```
### 5. Start a container based off of the image
```sh
nvidia-docker run  \
    -it --net=host -p 7860:7860 --gpus all \
    --mount type=bind,source=<my local model folder>,target=/stable-diffusion-webui-container/machine_learning_models \
    --mount type=bind,source=<my local output folder>,target=/stable-diffusion-webui-container/stable_diffusion_output \
    "stable-diffusion-webui-container:v1.5.1_extensions"
```

Note, that you can also open a terminal by appending `/bin/bash` to the command above. You will get to a terminal inside the running container and execute the bash script for linking the machine learning model folders. Afterwards you can start the webui manually with `bash run_webui.sh`.

Note, that you can also directly mount your model or output folders to the targets `stable-diffusion-webui-container/stable-diffusion-webui/models`, `stable-diffusion-webui-container/stable-diffusion-webui/models`.

### 6. (Re)run the container
If you exit the container and it is stopped, you can use 
```sh
docker ps --all
```
to retrieve the name of the `stable-diffusion-webui-container:v1.5.1_extensions` container and rerun and interactively enter it with
```sh
nvidia-docker restart <container name> &&  nvidia-docker exec -it <container name> /bin/bash
```
Inside the docker container's shell, you can run the webui again by using 
```sh
bash run_webui.sh
```

