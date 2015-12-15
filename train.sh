#!/bin/bash
if [ -f /home/ubuntu/.profile ]; then
 . /home/ubuntu/.profile
else
  echo "warning .profile doesnt exist"
fi
if [ -f /home/ubuntu/.bashrc ]; then
 . /home/ubuntu/.bashrc
else
  echo "warning .bashrc doesnt exist"
fi
cd /home/ubuntu/experiment
/home/ubuntu/torch/install/bin/th /home/ubuntu/experiment/train.lua -gpuid -1 -data_dir data/tinyshakespeare 
