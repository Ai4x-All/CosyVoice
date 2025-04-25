#!/bin/bash

# 进入项目目录
cd ../..

# 安装依赖
echo "Installing Python dependencies..."
pip3 install -r requirements.txt
cd runtime/python/grpc
python3 -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. cosyvoice.proto
cd ../../..
# 启动应用程序
echo "Starting CosyVoice application..."
python3 app.py
