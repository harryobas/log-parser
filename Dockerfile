FROM ruby:2.5

RUN apt-get update -yqq
COPY bloomon-bouquets.gemspec /usr/scr/bloomon-bouquet/
COPY Gemfile* /usr/src/bloomon-bouquet/

COPY . /usr/src/bloomon-bouquet/


WORKDIR /usr/src/bloomon-bouquet/

RUN gem install bundler -v 2.0.2
RUN bundle _2.0.2_ install

CMD ["/bin/bash"]
