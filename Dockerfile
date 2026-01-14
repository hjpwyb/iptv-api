FROM python:3.11-slim

# 安装 FFmpeg 和基础编译工具（解决某些包安装失败的问题）
RUN apt-get update && apt-get install -y \
    ffmpeg \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /iptv-api

# 先升级 pip
RUN pip install --upgrade pip

COPY . .

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1

CMD ["python", "main.py"]
