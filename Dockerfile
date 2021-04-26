# MicroC Dockerfile modified by Davit and Andreas
# Based on 18.04 LTS
FROM ubuntu:bionic

RUN apt-get -yq update && \
    apt-get -y upgrade && \
    apt-get -yq --no-install-suggests --no-install-recommends install \
    ocaml \
    menhir \
    llvm-6.0 \
    llvm-6.0-dev \
    m4 \
    git \
    aspcud \
    ca-certificates \
    python2.7 \
    pkg-config \
    cmake \
    clang \
    opam

# For testall.py and autosign.py
RUN apt-get -yq --no-install-suggests --no-install-recommends install -y python3-pip python3-dev \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip \
    && pip3 install colorama \
    && pip3 install GitPython

RUN ln -s /usr/bin/lli-6.0 /usr/bin/lli
RUN ln -s /usr/bin/llc-6.0 /usr/bin/llc

RUN opam init
RUN opam install \
    llvm.6.0.0 \
    ocamlfind

WORKDIR /root

ENTRYPOINT ["opam", "config", "exec", "--"]

CMD ["bash"]