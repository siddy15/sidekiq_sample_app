# Dockerfile
FROM ruby:3.2

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Create app directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Default command
CMD ["bundle", "exec", "sidekiq", "-r", "./main.rb", "-C", "config/sidekiq.yml"]
