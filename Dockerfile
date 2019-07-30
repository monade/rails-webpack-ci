FROM ruby:2.5.3

RUN ruby -v                                   # Print out ruby version for debugging
RUN apt-get update
    # Install nodejs and yarn
RUN apt-get install apt-transport-https -yqq
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -q && apt-get install nodejs -yqq
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -yqq
RUN alias node=nodejs
RUN gem install bundler --no-document    # Bundler is not installed with the image

RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
RUN wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
RUN apt-get update
RUN apt-get install -y heroku-toolbelt

