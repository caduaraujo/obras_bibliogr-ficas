FROM ruby:2.7.2-alpine3.12
RUN apk add --update --no-cache postgresql-dev nodejs yarn build-base
RUN mkdir /myapp
WORKDIR /myapp
EXPOSE 3000
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp