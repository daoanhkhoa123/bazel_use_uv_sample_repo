#!/usr/bin/env bash
set -euo pipefail

# Make uv select the CUDA 13.0 PyTorch wheels.

echo "=== Installing vLLM nightly (CUDA 13.0) ==="
UV_TORCH_BACKEND=cu130 \
uv pip install -U vllm \
    --extra-index-url https://wheels.vllm.ai/nightly/cu130

echo "=== Installing FlashInfer JIT cache (CUDA 13.0) ==="
uv pip install -U flashinfer-jit-cache \
    --index-url https://flashinfer.ai/whl/cu130

echo "=== Verifying installation ==="
python - <<'PY'
import torch

print("PyTorch version:", torch.__version__)
print("CUDA version:", torch.version.cuda)
print("CUDA available:", torch.cuda.is_available())
print("GPU count:", torch.cuda.device_count())

if torch.cuda.is_available():
    for i in range(torch.cuda.device_count()):
        print(f"GPU {i}:", torch.cuda.get_device_name(i))
PY

echo "=== Done ==="
