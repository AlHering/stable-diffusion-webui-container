FROM nvidia/cuda:11.7.0-devel-ubuntu20.04
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
COPY . .

# Install prerequisits
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common
RUN apt-get install -y make build-essential wget curl git nano ffmpeg libsm6 libxext6
RUN apt-get install -y p7zip-full p7zip-rar

# Install Python
RUN apt-get install -y python3-pip python3-venv

# Create venv
RUN if [ ! -d "venv" ]; \
then \
    python3 -m venv venv; \
fi 

# Access port
ENV PORT 7860
EXPOSE $PORT

# Setup output link
RUN ln -sf /stable-diffusion-webui-container/stable_diffusion_output /stable-diffusion-webui-container/stable-diffusion-webui/output
RUN /bin/bash /stable-diffusion-webui-container/link_shared_model_folders.sh

# Setting up stable-diffusion-webui
#RUN cd stable-diffusion-webui && /bin/bash webui.sh

# Start stable-diffusion-webui
CMD ["cd", "stable-diffusion-webui", "&&"  "/bin/bash", "webui.sh"]
