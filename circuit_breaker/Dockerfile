FROM ruby:2.7.0-alpine3.11 as base
WORKDIR /app
RUN apk add build-base 

FROM base as dev
COPY . /app

CMD ["ruby", "server.rb"]
