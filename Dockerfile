FROM ruby:3.1.2

RUN apt-get update -y

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV APP /app

RUN mkdir $APP

WORKDIR $APP

COPY Gemfile* ./
COPY local_gems ./local_gems

RUN bundle install -j4

COPY . $APP

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]