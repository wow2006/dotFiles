# CUDA
if [ -f "/opt/cuda/bin/nvcc" ]; then
  export CUDA_HOME=/opt/cuda/
  export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
  export PATH=${PATH}:${CUDA_HOME}/bin
fi

