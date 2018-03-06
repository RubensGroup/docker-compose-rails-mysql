#!/bin/bash
#Copy File to Customize the conection to BD
echo "Copy file database.yml in config dir App"
cp /config/database.yml /myrailsapp/config/database.yml

#Install rails gem in the APP
bundle install

#Prepare DB
if rails db:migrate:status &> /dev/null; then
  rails db:migrate
else
  rails db:setup
fi

#Up rails APP
rails s -p 3000 -b '0.0.0.0'