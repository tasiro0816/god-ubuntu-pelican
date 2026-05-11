FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -m -d /home/container container

# Chromiumを「snapなし」で入れるための手順を追加
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository -y ppa:xtradeb/apps \
    && apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    nodejs \
    npm \
    chromium \
    libnss3 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    curl \
    git \
    wget \
    && apt-get clean

# sudoがダメなら最初からrootで動く設定（USER行を消す）
# USER container
# ENV USER=container HOME=/home/container
# WORKDIR /home/container

CMD ["/bin/bash"]
