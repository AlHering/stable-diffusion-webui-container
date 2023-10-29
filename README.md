## Important Notes
- this repo is a highly customized and decoupled version of AUTOMATIC1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui/) 
- this repo is strongly linked personal infrastructure preferences and experiments
    - this especially includes the chosen extensions and the mounting and linking concept

## Used Repositories/Code
| Name         | Link     | commit |
|--------------|-----------|------------|
| AUTOMATIC1111's Stable Diffusion WebUI |  https://github.com/AUTOMATIC1111/stable-diffusion-webui/    |   68f336b     |
| a1111-sd-webui-lycoris | https://github.com/KohakuBlueleaf/a1111-sd-webui-lycoris.git | df9c0093 |
| a1111-sd-webui-tagcomplete | https://github.com/DominikDoom/a1111-sd-webui-tagcomplete.git | a7233a59 |
| clip-interrogator-ext | https://github.com/pharmapsychotic/clip-interrogator-ext.git | 0f1a4591 |
| ebsynth_utility | https://github.com/s9roll7/ebsynth_utility.git | 8ff9fbf2 |
| gif2gif | https://github.com/LonicaMewinsky/gif2gif.git | 5121851e |
| openpose-editor | https://github.com/fkunn1326/openpose-editor.git | c9357715 |
| posex | https://github.com/hnmr293/posex.git | 292f92d5 |
| sd-extension-system-info | https://github.com/vladmandic/sd-extension-system-info.git | 1841cf76 |
| sd-webui-3d-open-pose-editor | https://github.com/nonnonstop/sd-webui-3d-open-pose-editor.git | f2d5aac5 |
| sd-webui-additional-networks | https://github.com/kohya-ss/sd-webui-additional-networks.git | e9f3d622 |
| sd-webui-animatediff | https://github.com/continue-revolution/sd-webui-animatediff.git | 4a5461ee |
| sd-webui-ar | https://github.com/alemelis/sd-webui-ar.git | 3973c86a |
| sd-webui-aspect-ratio-helper | https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git | 99fcf9b0 |
| sd-webui-controlnet | https://github.com/Mikubill/sd-webui-controlnet.git | f2aafcf2 |
| sd-webui-infinite-image-browsing | https://github.com/zanllp/sd-webui-infinite-image-browsing.git | 93192ee1 |
| sd-webui-model-converter | https://github.com/Akegarasu/sd-webui-model-converter.git | b1f10148 |
| sd-webui-openpose-editor | https://github.com/huchenlei/sd-webui-openpose-editor.git | be6f54fa |
| sd-webui-segment-anything | https://github.com/continue-revolution/sd-webui-segment-anything.git | d80220ec |
| sd_dreambooth_extension | https://github.com/d8ahazard/sd_dreambooth_extension.git | 1a1d1621 |
| sd_save_intermediate_images | https://github.com/AlUlkesh/sd_save_intermediate_images.git | 24c3ce20 |
| stable-diffusion-webui-composable-lora | https://github.com/opparco/stable-diffusion-webui-composable-lora.git | a03d40eb |
| stable-diffusion-webui-dataset-tag-editor | https://github.com/toshiaki1729/stable-diffusion-webui-dataset-tag-editor.git | 7a2f4c53 |
| stable-diffusion-webui-images-browser | https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git | a3aeb93f |
| stable-diffusion-webui-rembg | https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg.git | 3d9eedbb |
| stable-diffusion-webui-state | https://github.com/ilian6806/stable-diffusion-webui-state.git | f2bb3809 |
| stable-diffusion-webui-two-shot | https://github.com/ashen-sensored/stable-diffusion-webui-two-shot.git | 6b55dd52 |
| ultimate-upscale-for-automatic1111 | https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git | 728ffcec |

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
nvidia-docker build -t stable-diffusion-webui-container:v1.6.0_extensions <path to repo folder>
```
### 5. Start a container based off of the image
```sh
nvidia-docker run  \
    -it --net=host -p 7860:7860 --gpus all \
    --mount type=bind,source=<my local model folder>,target=/stable-diffusion-webui-container/machine_learning_models \
    --mount type=bind,source=<my local output folder>,target=/stable-diffusion-webui-container/stable_diffusion_output \
    "stable-diffusion-webui-container:v1.6.0_extensions"
```

Note, that you can also open a terminal by appending `/bin/bash` to the command above. You will get to a terminal inside the running container and execute the bash script for linking the machine learning model folders. Afterwards you can start the webui manually with `bash run_webui.sh`.

Note, that you can also directly mount your model or output folders to the targets `stable-diffusion-webui-container/stable-diffusion-webui/models`, `stable-diffusion-webui-container/stable-diffusion-webui/output`.

### 6. (Re)run the container
If you exit the container and it is stopped, you can use 
```sh
docker ps --all
```
to retrieve the name of the `stable-diffusion-webui-container:v1.6.0_extensions` container and rerun and interactively enter it with
```sh
nvidia-docker restart <container name> &&  nvidia-docker exec -it <container name> /bin/bash
```
Inside the docker container's shell, you can run the webui again by using 
```sh
bash run_webui.sh
```

