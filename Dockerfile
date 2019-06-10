FROM tiangolo/uvicorn-gunicorn:python3.7-alpine3.8

MAINTAINER Koudai Aono (koxudaxi@gmail.com)

RUN apk add --update --no-cache mariadb-connector-c-dev && \
    apk add --no-cache --virtual .build-deps \
        build-base mariadb-dev && \
    pip install mysqlclient==1.4.2.post1 && \
    apk del .build-deps

COPY local_data_api /app
COPY requriements.txt /
RUN pip install -r /requriements.txt