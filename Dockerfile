# 使用轻量级 Python
FROM python:3.11-slim

# 安装 FFmpeg 和必要的系统库
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /iptv-api

# 复制项目文件
COPY . .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt

# 设置环境变量，强制不缓冲日志，让你能实时看到输出
ENV PYTHONUNBUFFERED=1

# 启动命令
CMD ["python", "main.py"]
