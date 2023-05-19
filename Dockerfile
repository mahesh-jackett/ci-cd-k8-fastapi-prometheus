# Use the official Python image from the Docker Hub
FROM python:3.8

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./ /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir fastapi uvicorn

# This command runs your application, comment out this line to compile only
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
