# Use the official Python image from the Docker Hub
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the requirements only first as it is mostly supposed to change 
COPY ./ /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# This command runs your application, comment out this line to compile only
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
