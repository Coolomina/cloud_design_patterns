FROM ruby:2.7.0-alpine3.11 as base
WORKDIR /app
RUN apk add build-base 
COPY . /app

CMD ["puma", "-p", "4567"]
