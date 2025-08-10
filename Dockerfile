# Use NVIDIA CUDA base image for GPU support
FROM nvidia/cuda:12.1-devel-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV CONDA_AUTO_UPDATE_CONDA=false

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    vim \
    nano \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -b -p /opt/conda \
    && rm /tmp/miniconda.sh

# Add conda to PATH
ENV PATH="/opt/conda/bin:$PATH"

# Copy environment file
COPY environment.yml /tmp/environment.yml

# Create conda environment
RUN conda env create -f /tmp/environment.yml

# Make RUN commands use the new environment
SHELL ["conda", "run", "-n", "claymodel", "/bin/bash", "-c"]

# Install additional dependencies needed for the notebooks
RUN pip install \
    pystac-client \
    stackstac \
    rasterio \
    rioxarray \
    jupyter \
    jupyterlab \
    ipywidgets \
    nb_conda_kernels

# Install claymodel in development mode
COPY . /workspace/claymodel
WORKDIR /workspace/claymodel
RUN pip install -e .

# Create a non-root user
RUN useradd -m -s /bin/bash -N -u 1000 jupyter
RUN chown -R jupyter:jupyter /workspace
USER jupyter

# Expose Jupyter port
EXPOSE 8888

# Set the default command to start Jupyter
CMD ["conda", "run", "-n", "claymodel", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
