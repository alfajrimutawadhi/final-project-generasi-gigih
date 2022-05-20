FROM ruby:3.0

RUN gem install rails

WORKDIR /myapp

COPY . .

RUN bundle install

RUN rails db:migrate

CMD rails server -b 0.0.0.0 -p $PORT