###############################
#   RUN PART
###############################


export CUDA_VISIBLE_DEVICES=0
# fix this please 

# NOTE: Fix cicc and ncc, cuda 12.9 for flash attention being used
# set at the ~/.bashrc; so no needs for these 
# export CUDA_HOME=/usr/local/cuda-12.9
# export PATH=$CUDA_HOME/bin:$CUDA_HOME/nvvm/bin:$PATH
# export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
# wexport CPATH=$CUDA_HOME/include:$CPATH
# export CPLUS_INCLUDE_PATH=$CUDA_HOME/include:$CPLUS_INCLUDE_PATH

MODEL_NAME="Qwen/Qwen3-VL-4B-Instruct"


uv run vllm serve $MODEL_NAME \
    --port 9010 \
    --trust-remote-code \
    --tensor-parallel-size 1 \
    --max-model-len 4096 \
    --max-num-seqs 6 \
    --max-num-batched-tokens 4096 \
    --gpu-memory-utilization 0.92 \
    --attention-backend flashinfer \
    --kv-cache-dtype fp8 \
    --dtype bfloat16 \
    --max-logprobs 20

    # --trust-remote-code \
    # --tensor-parallel-size 1 \
    # --max-model-len 8192 \
    # --max-num-seqs 2   \
    # --gpu-memory-utilization 0.97   \
    # --max-num-batched-tokens 8192 \
    # --enable-prefix-caching \
    # --attention-backend flashinfer \
    # --kv-cache-dtype fp8 \
    # --dtype bfloat16