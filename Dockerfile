FROM alpine:3.9

LABEL maintainer="nyankokota <mail@nyanko-kota.com>"

ENV PGWEB_VERSION 0.11.0

RUN \
  apk update && \
  apk add --no-cache ca-certificates openssl postgresql wget && \
  update-ca-certificates \
  cd /tmp && \
  wget -q https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip && \
  unzip pgweb_linux_amd64.zip -d /usr/bin && \
  mv /usr/bin/pgweb_linux_amd64 /usr/bin/pgweb && \
  rm -f pgweb_linux_amd64.zip

ADD ./wait.sh /usr/bin/wait.sh

EXPOSE 8081

CMD ["/usr/bin/pgweb", "--bind=0.0.0.0", "--listen=8081"]