# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg

# Copy the local requirements file to the container's workspace
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the entire project directory to the container's workspace
COPY . .

# Entrypoint command to run the Python script
CMD ["python3", "-m", "Bot"]

