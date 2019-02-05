FROM ruby:2.6.0

RUN apt-get update -qq && \
  apt-get install -y apt-utils build-essential apt-transport-https libxml2-dev libpq-dev postgresql-client unzip
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN bundle config path /usr/local/bundle
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile* $APP_ROOT/
RUN gem install bundler && bundle install

COPY . $APP_ROOT/

CMD ["bundle", "exec", "rails", "server"]
