FROM python:3.11-slim

WORKDIR /app

# Install runtime deps
COPY requirements.txt ./
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy pipeline
COPY pipeline/ ./pipeline

# Default command (can be overridden at runtime)
CMD ["python", "pipeline/pipeline.py", "1"]
