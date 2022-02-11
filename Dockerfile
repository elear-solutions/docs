FROM python:slim

COPY requirements.txt /tmp/

RUN apt update && \
    apt install -y git && \
    apt install -y make && \
    apt install -y python3-enchant && \
    pip3 install -r /tmp/requirements.txt

EXPOSE 8000

CMD bash
