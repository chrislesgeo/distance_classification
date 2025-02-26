
# Use the official Python 3.11 image
FROM python:3.11

# Set working directory
WORKDIR /distance_classification

# Copy all project files into the container
COPY . .

# Install dependencies for OpenCV and Qt
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libx11-dev \
    libxcb-xinerama0 \
    libxkbcommon-x11-0 \
    libxcb1 \
    libxext6 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    libqt5gui5 \
    libqt5widgets5 \
    libsm6 \
    libxfixes3 \
    && rm -rf /var/lib/apt/lists/*

# Set Qt to run in headless mode
ENV QT_QPA_PLATFORM=offscreen

# Install Python libraries
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scikit-learn \
    wandb \
    jupyter \
    matplotlib \
    opencv-python 

# Run Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]

