FROM docker:dind

# install docker-compose
RUN apk add --no-cache py-pip
RUN pip install docker-compose

# install git
RUN apk add --no-cache bash git

# install yarn
Run apk add --no-cache yarn

# get projects
RUN git clone https://github.com/peach-hack/auto-matching.git app
ENV APP_ROOT /app
WORKDIR $APP_ROOT
