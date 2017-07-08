FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libxml2-dev libxslt1-dev

ENV APP_HOME /react-shot-api

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME

RUN bundle install

ADD . $APP_HOME
