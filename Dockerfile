FROM ruby:3.0-alpine
RUN apk update && \
  apk upgrade && \
  apk add --no-cache gcompat && \
  apk add --no-cache mysql-client mysql-dev linux-headers libxml2-dev make gcc libc-dev nodejs tzdata git bash && \
  apk add --virtual build-packages --no-cache build-base curl-dev
RUN mkdir /dictionary-api
WORKDIR /dictionary-api
ADD Gemfile /dictionary-api/Gemfile
ADD Gemfile.lock /dictionary-api/Gemfile.lock
RUN bundle install
RUN apk del build-packages
ADD . /dictionary-api
EXPOSE 4000
CMD ["rails", "server", "-b", "0.0.0.0"]