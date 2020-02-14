FROM python:3.7 as builder

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
# Python, don't write bytecode!
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update && apt-get install -y cmake bison flex rsync

RUN pip install tartiflette-aiohttp==1.1.1

FROM python:3.7-alpine

COPY --from=builder /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages

