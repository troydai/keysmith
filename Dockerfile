FROM alpine:3.17

RUN apk add --update-cache openssl && rm -rf /var/cache/apk/*

ENV OUTPUT_DIR /opt/output
ENV CN_SUBJECT /C=US/ST=WA/O=Acme/CN=example.com

WORKDIR /run
COPY ./src/gen.sh /run

CMD ["./gen.sh"]
