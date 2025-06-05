FROM ruby:3.3.7

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set working directory
WORKDIR /app

# Copy Gemfiles and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Precompile assets (optional)
# RUN bundle exec rake assets:precompile

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
