FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -y install wget unzip build-essential curl git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home

RUN git clone https://github.com/Perl-Toolchain-Gang/Test-Smoke.git
RUN curl -L https://cpanmin.us | perl - System::Info Capture::Tiny CGI::Util LWP::UserAgent

WORKDIR /home/Test-Smoke/bin

COPY configs/* ./
RUN chmod +x smokecurrent.sh

CMD ["./smokecurrent.sh"]
