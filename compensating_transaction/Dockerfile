FROM ruby:2.7.0-alpine3.11
ENV WORKDIR /app
WORKDIR ${WORKDIR}

CMD ["bundle", "exec", "sidekiq", "-r", "./worker.rb"]