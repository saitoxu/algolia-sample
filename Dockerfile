FROM ruby:2.7.0-alpine

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apk update \
  && apk add ca-certificates wget \
  && update-ca-certificates

RUN mkdir /app
WORKDIR /app

RUN apk update && \
  apk upgrade && \
  apk add --update --no-cache --virtual build-dependencies \
  build-base \
  curl-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  ruby-dev \
  yaml-dev \
  zlib-dev && \
  apk add --update --no-cache \
  bash \
  git \
  openssh \
  ruby-json \
  tzdata \
  yaml \
  less \
  graphviz \
  ttf-freefont \
  sqlite \
  sqlite-dev \
  vim \
  curl
