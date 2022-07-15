FROM ruby:alpine

ENV UNO_URL https://raw.githubusercontent.com/dagwieers/unoconv/master/unoconv
RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  gcompat \
  libxml2-dev \
  nodejs \
  libffi-dev \
  readline \
  postgresql-dev \
  linux-headers \
  readline-dev \
  imagemagick \
  tzdata \
  openssh \
  git \
  vips-dev \
  ffmpeg \
  poppler \
  poppler-utils \
  curl \
  util-linux \
  libreoffice \
  ttf-droid-nonlatin \
  ttf-droid \
  ttf-dejavu \
  ttf-freefont \
  ttf-liberation \
  && curl -Ls $UNO_URL -o /usr/local/bin/unoconv \
  && chmod +x /usr/local/bin/unoconv \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && apk del curl \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./dockerfiles/core/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

EXPOSE 3000
