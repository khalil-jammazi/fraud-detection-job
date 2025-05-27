FROM python:3.7-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PORT=8501

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE $PORT

# Use shell form to properly expand environment variable
CMD streamlit run app.py --server.port=${PORT} --server.address=0.0.0.0