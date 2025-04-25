FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime as builder
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/CosyVoice

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get -y install git unzip git-lfs g++ && \
    git lfs install && \
    git clone --recursive https://github.com/FunAudioLLM/CosyVoice.git && \
    cd CosyVoice && \
    pip3 install -r requirements.txt && \
    cd runtime/python/grpc && \
    python3 -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. cosyvoice.proto && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/CosyVoice

COPY --from=builder /opt/CosyVoice/CosyVoice /opt/CosyVoice/CosyVoice

CMD ["python3", "app.py"]