# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.2.3

# Rails app lives here
WORKDIR /opt/app

# Set production environment
ENV RAILS_ENV="development" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends sqlite3 build-essential git libvips pkg-config

RUN gem install bundler -v 1.17.3
COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock
# RUN bundle config --local build.sassc --disable-march-tune-native
RUN bundle install

COPY . /opt/app/

RUN rm -rf tmp && mkdir tmp
RUN rm -rf log && mkdir log

EXPOSE 3000
CMD rails s -b '0.0.0.0'
