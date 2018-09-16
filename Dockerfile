FROM ubuntu:18.04

RUN apt update && apt install -y curl wget \
    && wget -c https://github.com/eoscanada/pitreos/releases/download/v1.0.0/pitreos_1.0.0_linux_x86_64.tar.gz \
    && tar -xvzf pitreos_1.0.0_linux_x86_64.tar.gz -C /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/*

ADD restore.sh /restore.sh

CMD ["/restore.sh"]
