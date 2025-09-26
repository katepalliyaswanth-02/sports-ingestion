# Use official Python slim image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first (for Docker caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Ensure pipeline.py is executable
RUN chmod +x pipeline.py

# Command to run the pipeline
CMD ["python", "pipeline.py"]
