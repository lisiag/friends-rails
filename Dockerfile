# https://github.com/iamovrhere/friend-list-on-rails/
# From: https://docs.docker.com/samples/rails/
FROM ruby:2.7.1 AS base

ARG TARGET_APP='app'
ARG TARGET_DIR='.'

WORKDIR /$TARGET_APP
COPY $TARGET_DIR/ /$TARGET_APP/

# FROM base as dev

# # When bootstrapping from fresh, this will fail.
# RUN bundle install || true

# FROM base AS prod

RUN bundle install

# Service that runs on container launch.
CMD rails server -b 0.0.0.0
