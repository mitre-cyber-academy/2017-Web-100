FROM ruby:2.4.1-onbuild

ONBUILD RUN bundle install

COPY Server.rb /usr/src/app

COPY public /usr/src/app

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV RACK_ENV production

CMD ["ruby", "Server.rb"]