#!/bin/bash

# 进入项目目录
cd /opt/CosyVoice/CosyVoice

# 安装依赖
echo "Installing Python dependencies..."
pip3 install -r requirements.txt
cd CosyVoice/runtime/python/grpc
python3 -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. cosyvoice.proto

# 启动应用程序
echo "Starting CosyVoice application..."
python3 app.py
