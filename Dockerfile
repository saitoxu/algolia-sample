FROM ruby:2.7.0-alpine

# ENV ENTRYKIT_VERSION 0.4.0
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apk update \
  && apk add ca-certificates wget \
  && update-ca-certificates

# RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
#   && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
#   && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
#   && mv entrykit /bin/entrykit \
#   && chmod +x /bin/entrykit \
#   && entrykit --symlink

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
  sqlite-dev

# RUN bundle config --local set path 'vendor/bundle'
# RUN bundle init
# ENTRYPOINT [ \
#   "prehook", "bundle install -j4 --quiet", "--"]
