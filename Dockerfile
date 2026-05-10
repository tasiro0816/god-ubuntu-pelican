FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# containerユーザーを先に作る
RUN useradd -m -d /home/container container

# インストール
RUN apt-get update && apt-get install -y \
    python3 python3-pip nodejs npm \
    chromium-browser libnss3 libatk1.0-0 libcups2 libdrm2 libgbm1 \
    curl git wget build-essential \
    && apt-get clean

# 【ここが重要！】containerユーザーに、システムの重要フォルダへの権限を「先行して」与える
# ※ sudoなしで pip install やファイルの書き換えができるようにします
RUN chown -R container:container /usr/local /opt /var/lib

# Pelican用の設定
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

CMD ["/bin/bash"]
