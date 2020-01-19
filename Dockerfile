FROM ruby:2.5

RUN apt-get update -yqq
COPY log-parser.gemspec /usr/scr/log-parser/
COPY Gemfile* /usr/src/log-parser/

COPY . /usr/src/log-parser/


WORKDIR /usr/src/log-parser/

RUN gem install bundler -v 2.0.2
RUN bundle _2.0.2_ install

CMD ["/bin/bash"]
