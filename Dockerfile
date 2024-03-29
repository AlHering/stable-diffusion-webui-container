FROM nvidia/cuda:11.7.1-devel-ubuntu20.04
ENV PYTHONUNBUFFERED 1

# Setting up basic repo 
ARG DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setting up working directory
ADD ./ stable-diffusion-webui-container/
WORKDIR /stable-diffusion-webui-container
ENV RUNNING_IN_DOCKER True
ENV STRICT_EXTENSION_VERSIONING False
COPY . .

# Install prerequisits
RUN apt-get update && apt-get install -y apt-utils software-properties-common
RUN apt-add-repository -y ppa:deadsnakes/ppa && apt-get update && apt-get install -y \
    make build-essential wget curl git nano ffmpeg libsm6 libxext6 \
    p7zip-full p7zip-rar \
    git git-lfs\
    python3.10-full python-is-python3 \
    libgoogle-perftools4 libtcmalloc-minimal4 libgoogle-perftools-dev \
    pkg-config libcairo2-dev libjpeg-dev libgif-dev \
    && apt-get clean -y && git lfs install

# Create venv
RUN if [ ! -d "venv" ]; \
    then \
    python3.10 -m venv venv; \
    fi

# Access port
ENV PORT 7860
EXPOSE $PORT

# Setup links
RUN ln -sf /stable-diffusion-webui-container/stable_diffusion_output /stable-diffusion-webui-container/stable-diffusion-webui/output && /bin/bash /stable-diffusion-webui-container/link_shared_model_folders.sh

# Install extensions
RUN git config --global http.postBuffer 1048576000 && python3 /stable-diffusion-webui-container/install_extensions.py

# Setting up stable-diffusion-webui
RUN bash /stable-diffusion-webui-container/install_webui.sh

# Command for starting webui
CMD ["/bin/bash", "run_webui.sh"]
