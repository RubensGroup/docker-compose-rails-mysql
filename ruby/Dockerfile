#Ruby version in my Docker
FROM ruby:2.3.0

#Install dependencies of System for my App
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs \
    nano  mysql-client --no-install-recommends
    
#Set the directory how workspace
WORKDIR /myrailsapp

#Install bundle dependencies for my app
RUN gem install bundle