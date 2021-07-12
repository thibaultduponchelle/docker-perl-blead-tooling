FROM ubuntu:18.04

WORKDIR /home

RUN apt-get update \
    && apt-get -y install wget unzip build-essential curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/abeltje/Test-Smoke.git
RUN curl -L https://cpanmin.us | perl - System::Info Capture::Tiny CGI::Util LWP::UserAgent

WORKDIR /home/Test-Smoke/bin

COPY configs/* ./
RUN chmod +x smokecurrent.sh

CMD ["./smokecurrent.sh"]
