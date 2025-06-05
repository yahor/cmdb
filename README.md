# README
CMDB - web application to track configuration items (CIs)

## Features

* Configuration Item Management: Create, read, update, and delete CIs with ease.

* Relationship Tracking: Define relationships between different CIs.

* Filter: Quickly locate specific CIs using filtering capabilities.

* Dashboard with total count numbers and main menu.

* User Authentication: Secure access to the application with user authentication mechanisms.
Users have 'admin' and 'user' roles. User has read only access.

* Responsive Design: Accessible on various devices with a responsive user interface (MVP, WIP).*

# Getting Started
## Prerequisites
Ensure you have the following installed:

* Ruby 3.3.8
* Rails 8
* PostgreSQL
* Node.js and Yarn
* TailwindCSS
* git

<!-- ### Other
* System dependencies

* Configuration

* Database creation

* Database initialization

* Services (job queues, cache servers, search engines, etc.) -->

## Run docker commands:

### Build the image and start services
`docker-compose build`
`docker-compose up`

### In another terminal, create the database,
`docker-compose run web rake db:create db:migrate`
### To seed DB
`docker-compose run web rake db:seed`

use http://localhost:3000/ in browser to open site.


## Testing
Rspec used for tests.

`rspec spec/`

## Deployment instructions
 TBD