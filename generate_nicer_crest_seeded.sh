#!/bin/bash

name=$1
seed=$2
echo "Generating image $name with seed $seed."
seed=$seed name=$name gpu=1 batchSize=1 imsize=10 noisemode=linefull net=/home/ubuntu/dcgan.torch/checkpoints/wappenwiki_1000_net_G.t7 th generate_seed.lua
