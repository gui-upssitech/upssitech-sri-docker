#!/bin/bash

GPU_VENDOR=$(lspci | grep -E "VGA|3D controller" | grep -i -o -E "Intel|NVIDIA|AMD" | head -n 1)

if [ "$GPU_VENDOR" == "NVIDIA" ]; then
    GPU_CONFIG="--gpus all"
elif [ "$GPU_VENDOR" == "AMD" ]; then
    GPU_CONFIG="--device=/dev/kfd --device=/dev/dri --group-add video"
else
    GPU_CONFIG="--device /dev/dri/card0"
fi

docker run \
    $GPU_CONFIG \
    -e DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    $*