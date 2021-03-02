FROM python:3.8

LABEL maintainer="Artem Morozov <artem.morozov@corp.mail.ru>"

RUN apt-get update && apt-get -y install --no-install-recommends --no-install-suggests \
    texlive \
    texlive-lang-cyrillic \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-extra-utils \
    librsvg2-bin \
    xzdec \
    plantuml \
    graphviz \
    pandoc \
    cmake && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -L https://tarantool.io/release/2.6/installer.sh | bash && \
    apt-get install -y tarantool && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN tarantoolctl rocks install \
      https://raw.githubusercontent.com/tarantool/LDoc/tarantool/ldoc-scm-2.rockspec \
      --server=http://rocks.moonscript.org

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --no-cache-dir

ENV PATH=/.rocks/bin:$PATH

RUN mkdir /doc
WORKDIR /doc
