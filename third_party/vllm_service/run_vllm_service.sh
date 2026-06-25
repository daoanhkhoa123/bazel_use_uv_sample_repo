#!/usr/bin/env bash

###############################
#   BUILD PART
###############################
set -euo pipefail
ls
cd "$BUILD_WORKSPACE_DIRECTORY/third_party/vllm_service"

echo "=== Installing vLLM + FlashInfer for CUDA 13.0 ==="
./install_venv_cu130.sh


echo "=== Running vLLM Serivce ==="
./run_qwen3_vllm.sh