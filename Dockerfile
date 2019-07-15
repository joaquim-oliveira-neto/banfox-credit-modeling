FROM ruby:2.6.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev yarn less

RUN mkdir /app
WORKDIR /app
run rm -rf Gemfile.lock

COPY . .
RUN gem update --system
RUN bundle install --path ../gems
RUN yarn install --check-files

LABEL maintainer="Ricardo Sasaki <sasaki@banfox.com.br>"
