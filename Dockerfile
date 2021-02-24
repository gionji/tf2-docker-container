FROM "ubuntu:latest"

RUN apt-get update && yes | apt-get upgrade

RUN mkdir -p /tensorflow/models

ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    bzip2 \
    unzip \
    build-essential \
    cmake \
    git \
    libgtk2.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libboost-all-dev \
    pkg-config \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \ 
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libdc1394-22-dev \
    gfortran \
    curl \
    vim


RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python3.6 \
    python3-pip

RUN python3 --version
RUN pip3 --version

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN pip3 install --upgrade  setuptools 
    

COPY requirements.txt .

RUN pip3 install -r requirements.txt 
RUN pip3 install grpcio==1.32.0 wheel==0.35

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

