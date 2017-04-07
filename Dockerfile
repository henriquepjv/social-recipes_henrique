FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs


COPY Gemfile* ./
COPY Gemfile.lock* ./
RUN gem install bundler -v 1.14.5
RUN bundle install

WORKDIR /social-recipes_henrique

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]