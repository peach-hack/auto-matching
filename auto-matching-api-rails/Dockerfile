FROM ruby:2.6.0

RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential apt-transport-https libxml2-dev libpq-dev postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs
RUN npm install -g phantomjs-prebuilt

RUN bundle config path /usr/local/bundle
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
