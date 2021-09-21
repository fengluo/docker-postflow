FROM python:3-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add tzdata && \
    apk add --virtual .build-deps git build-base libffi-dev && \
    pip install git+https://github.com/TryPostFlow/PostFlow.git &&\
    echo "Asia/Shanghai" >  /etc/timezone && \
    apk del tzdata && \
    apk del .build-deps && \
    rm -r /var/cache/apk
WORKDIR /app
EXPOSE 8000
CMD [ "postflow", "start", "-h", "0.0.0.0" ]
