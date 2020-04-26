#!/usr/bin/env bash


#seed_sum= zless $1

seed_num=$(zless $1 | awk '$2 !="NA"' | awk '{sub(/\//,"\t",$2)};1' | sed 's/[rs"]//g' | awk 'FNR > 1 {if ($2 == "A") x=1; if ($2 == "C") x=2; if ($2 == "T") x=3; if ($2 == "G") x=4; if ($3 == "A") y=1; if ($3 == "C") y=2; if ($3 == "T") y=3; if ($3 == "G") y=4; z=$1; u=y+x; s=1/u; q=z^s; sum += q} END {print sum}')

printf "\nThis is the generated seed num: ${seed_num}\n\n"

#exit
cd /home/ubuntu/poetry/poetry-generator
gen_poem=$(sudo python /home/ubuntu/poetry/poetry-generator/poem_v2.py ${seed_num}) 
#sudo python /home/ubuntu/poetry/poetry-generator/poem_v2.py ${seed_num} > generated_poem.txt
cd /home/ubuntu/Jons_working_env
printf "${gen_poem}" > "$2.txt"


image_name=$2

export TERM=xterm
export CUDNN_PATH=/usr/local/cuda/lib64/libcudnn.so.7.6.5

cd /home/ubuntu/dcgan.torch
/home/ubuntu/dcgan.torch/generate_crest_seeded.sh ${image_name} ${seed_num}
cd /home/ubuntu/Jons_working_env

mv /home/ubuntu/dcgan.torch/${image_name}.png /home/ubuntu/Jons_working_env/${image_name}.png	
printf "success baby"
