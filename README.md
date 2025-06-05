# README
CMDB - web application to track configuration items (CIs)

# TODO add full description
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Run docker commands:

# Build the image and start services
docker-compose build
docker-compose up

# In another terminal, create the database,
docker-compose run web rake db:create db:migrate
# To seed DB
docker-compose run web rake db:seed

use http://localhost:3000/ in browser to open site.
