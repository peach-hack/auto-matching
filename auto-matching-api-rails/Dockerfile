FROM ruby:2.6.0

RUN apt-get update -qq && \
  apt-get install -y apt-utils build-essential apt-transport-https libxml2-dev libpq-dev postgresql-client unzip
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

# Japanese
RUN cd /tmp && \
    mkdir noto && \
    curl -O -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    unzip NotoSansCJKjp-hinted.zip -d ./noto && \
    mkdir -p /usr/share/fonts/noto && \
    cp ./noto/*.otf /usr/share/fonts/noto/ && \
    chmod 644 /usr/share/fonts/noto/*.otf && \
    fc-cache -fv && \
    rm -rf NotoSansCJKjp-hinted.zip ./noto
    
# Install Chrome WebDriver
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
  mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION && \
  curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
  unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION && \
  rm /tmp/chromedriver_linux64.zip && \
  chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver && \
  ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver

# Install Google Chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get -yqq update && \
  apt-get -yqq install google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

RUN bundle config path /usr/local/bundle
ENV APP_ROOT /app

# ENV CHROMEDRIVER_PORT 4444
# ENV CHROMEDRIVER_WHITELISTED_IPS "127.0.0.1"
# ENV CHROMEDRIVER_URL_BASE ''
# ENV CHROMEDRIVER_EXTRA_ARGS ''

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile* ./

RUN gem install bundler && bundle install
