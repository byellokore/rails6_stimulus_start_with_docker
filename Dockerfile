FROM ruby:2.7.1

LABEL maintener="gabriel@byel.dev"

RUN apt-get update -yqq
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -yqq nodejs
RUN npm install -yqq --global yarn

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
RUN npm install yarn -g
RUN gem update
COPY . /usr/src/app/
RUN yarn install
RUN yarn upgrade
CMD ["rails", "s", "-b", "0.0.0.0"]