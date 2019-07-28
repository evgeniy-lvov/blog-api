[![Build Status](https://travis-ci.org/evgeniy-lvov/blog-api.svg?branch=master)](https://travis-ci.org/evgeniy-lvov/blog-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/97c2979a1097a02a80e2/maintainability)](https://codeclimate.com/github/evgeniy-lvov/blog-api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/97c2979a1097a02a80e2/test_coverage)](https://codeclimate.com/github/evgeniy-lvov/blog-api/test_coverage)
[![Blog API Documentation](https://img.shields.io/badge/documentation-API-informational)](https://evgeniy-lvov.github.io/blog-api/)

# blog-api

Rails JSON API for a blog. Umbrellio company test project.

## Requirements

* Ruby 2.6.1  
* Rails 5.2.3  
* PostgreSQL  
* Bundler  

## Installation

Install all dependencies from the application directory:

```sh
bundle
```

Database creation and migrations:

```sh
rake db:create & rake db:migrate
```

Start application:

```sh
rails s
```

## Database seeding

Seeds with 200 000 posts:

```sh
rake db:seed
```

Seeds with 5 000 posts:

```sh
rake db:seed minimal=yes
```

## Links

* [API documentation](https://evgeniy-lvov.github.io/blog-api/)
* [Staging on Heroku](https://test-blog-api-staging.herokuapp.com/) (with 5000 posts seeds)
