FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime as builder
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/CosyVoice

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get -y install git unzip git-lfs g++ && \
    git lfs install && \
    git clone --recursive https://github.com/Ai4x-All/CosyVoice.git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/CosyVoice

COPY --from=builder /opt/CosyVoice/CosyVoice /opt/CosyVoice/CosyVoice
COPY start.sh /opt/CosyVoice/
RUN chmod +x /opt/CosyVoice/start.sh

CMD ["/opt/CosyVoice/start.sh"]