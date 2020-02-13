FROM python:3.7 as builder

RUN apt-get update && apt-get install -y cmake bison flex rsync

RUN pip install tartiflette-aiohttp==1.2.0

FROM python:3.7-alpine

COPY --from=builder /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages

