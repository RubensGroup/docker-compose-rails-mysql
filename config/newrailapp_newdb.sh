#!/bin/bash
#Creation files to install Bundle
touch Gemfile Gemfile.lock

#generate File Gemfile to install Rails
if ! grep -R  "gem 'rails'" Gemfile > /dev/null
then

echo "source 'https://rubygems.org'
gem 'rails', '~> 5.0.0' " >> Gemfile

bundle install

#Creartion of my New App
rails new . --force --database=mysql --skip-bundle
fi

echo "Copy file database.yml in config dir App"
cp /config/database.yml /myrailsapp/config/database.yml

#Prepare DB
if rails db:migrate:status &> /dev/null; then
  rails db:migrate
else
  rails db:setup
fi

bundle install
#Up rails APP
rails s -p 3000 -b '0.0.0.0'

