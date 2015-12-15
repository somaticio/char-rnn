FROM somatic/cuda
#ADD * /home/ubuntu/experiment/    <--- this should work,its a bug with docker https://github.com/docker/docker/issues/18396
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install nngraph
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install optim
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install nn
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cutorch
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cunn
RUN git clone https://github.com/somaticio/char-rnn /home/ubuntu/experiment
ADD .docker-experimentconfig /home/ubuntu/experiment/.experimentconfig
RUN cd /home/ubuntu/somaticagent/ && git pull
RUN cd /home/ubuntu/experiment && git pull #use this to force an update
RUN python /home/ubuntu/somaticagent/web.py -i
