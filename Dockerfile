FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -qqy build-essential nodejs
CMD npm install --global yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock yarn.lock /app/

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

RUN bundle install

ENV RAILS_ENV production
ENV RACK_ENV production

COPY . /app

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD bundle exec rails server
