FROM python:2.7.16-alpine3.9

RUN apk --no-cache add --virtual=.build-dep build-base \
    && apk --no-cache add zeromq-dev \
    && apk --no-cache add python-dev \
    && apk --no-cache add musl-dev \
    && pip install --no-cache-dir locustio==0.11.0 \
    && pip install --no-cache-dir grpcio==1.19.0 \
    && pip install --no-cache-dir grpcio-tools==1.19.0 \
    && apk del .build-dep

CMD ["locust"]