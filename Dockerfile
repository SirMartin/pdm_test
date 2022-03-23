FROM python:3.9.7-slim

RUN set -ex \
    && apt-get update \
    && pip3 install --no-cache --upgrade pdm

WORKDIR /src
COPY . ./

RUN pdm install

RUN pdm run -v flake8 --ignore=E501,W503 assembler.py

RUN python assembler.py examples/code.txt
RUN python assembler.py examples/test.txt
