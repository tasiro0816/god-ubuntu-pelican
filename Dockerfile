FROM ubuntu:22.04

# タイムゾーン等の対話型アラートを無視
ENV DEBIAN_FRONTEND=noninteractive

# Pelican用のユーザー作成
RUN useradd -m -d /home/container container

# あなたが欲しいものを全部ここに書く
RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    nodejs \
    npm \
    chromium-browser \
    libnss3 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    curl \
    git \
    wget \
    && apt-get clean

# sudoをパスワードなしで使えるようにする
RUN echo "container ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 実行環境の設定
# USER container
# ENV USER=container HOME=/home/container
# WORKDIR /home/container

CMD ["/bin/bash"]
