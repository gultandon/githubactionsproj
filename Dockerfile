# Use official Python image (multi-arch supported)
FROM python:3.14-alpine

# Set working directory
WORKDIR /app

# Copy dependency file first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Expose application port
EXPOSE 3000

# Start application
CMD ["python", "app.py"]
