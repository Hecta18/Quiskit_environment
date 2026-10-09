# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create a fresh virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install Qiskit 1.0+ with compatible packages only
RUN pip install --upgrade pip && \
    pip install --no-cache-dir \
    qiskit \
    qiskit-aer \
    qiskit-ibm-runtime \
    jupyter \
    notebook \
    matplotlib \
    numpy \
    scipy

# Expose port for Jupyter
EXPOSE 8888

# Default command
CMD ["/bin/bash"]

