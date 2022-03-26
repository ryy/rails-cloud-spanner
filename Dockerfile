FROM ruby:2.6.9

#RUN apt-get update -y && \
#    apt-get install default-mysql-client nodejs npm -y && \
#    npm uninstall yarn -g && \
#    npm install yarn -g -y

RUN apt-get update -y

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV APP /app

RUN mkdir $APP

WORKDIR $APP

COPY Gemfile* ./

RUN bundle install -j4
#RUN yarn install

COPY . $APP

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]