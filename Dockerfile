FROM python:3.8-slim

LABEL maintainer="Artem Morozov <artem.morozov@corp.mail.ru>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY requirements.txt /tmp/requirements.txt
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get -y install --no-install-recommends --no-install-suggests \
        curl=7.* \
        texlive=20* \
        texlive-lang-cyrillic=20* \
        texlive-latex-extra=20* \
        texlive-fonts-extra=20* \
        texlive-extra-utils=20* \
        librsvg2-bin=2.* \
        xzdec=5.2.* \
        plantuml=1* \
        graphviz=2.* \
        pandoc=2.* \
        make=4.* \
        gcc=4* \
        unzip=6.* \
        git=1:* \
        build-essential=12.* \
        libc6-dev=2* \
        cmake=3.* && \
    curl -L https://tarantool.io/release/2.6/installer.sh | bash && \
    apt-get install -y tarantool=2.6.* tarantool-dev=2.6.* \
        --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    tarantoolctl rocks install \
        https://raw.githubusercontent.com/tarantool/LDoc/tarantool/ldoc-scm-2.rockspec \
            --server=http://rocks.moonscript.org && \
    pip install -r /tmp/requirements.txt --no-cache-dir && \
    mkdir /doc

ENV PATH=/.rocks/bin:$PATH

WORKDIR /doc
