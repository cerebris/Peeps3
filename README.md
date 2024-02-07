# Peeps 3

## Overview

This is a simple test app for testing [JSONAPI::Resources](https://github.com/cerebris/jsonapi-resources).

It supports the three different resource retrieval strategies under different namespaces, V09, V10, V11.

It is currently setup to use JR from a local directory that is a sibling of where this is checked out, but this can 
of course be changed in the Gemfile.

The app provides access to a contacts database with the following features for testing and demonstrating the JR v0.11
release (currently in development). The database will be seeded with a fairly large set of realistic data using the 
seeds script and the Faker gem.

### Models

#### User

Users of the application. These can be admins or regular users, set by an `admin` boolean. 

Requests to Peeps3 can be authenticated or not. Pass in a `username` as the content of an `Authorization` header.

Relationships:
* `has_many :images, as: :imageable` - Images of the user using a polymorphic type
* `has_many :contacts, foreign_key: "created_by_user_id"` - Contacts created by the User

#### Contact

Contacts managed by Peeps3. Contacts have email, names, and a `public` boolean setting. The public setting is used to 
determine if a contact can be accessed without authorization.

Relationships:
* `belongs_to :creator, foreign_key: "created_by_user_id", class_name: "User"` - The user that created the contact
* `has_many :phone_numbers`
* `has_many :images, as: :imageable` - Images of the contact using a polymorphic type


#### Image

Images of Contacts or Users, using a polymorphic relationship. No real images are stored, just filenames to 
keep it simple.

Relationships:
* `belongs_to :imageable, polymorphic: true`
* `belongs_to :user,-> { left_joins(:images).where(images: {imageable_type: 'User'}) }, foreign_key: 'imageable_id', optional: true`
* `belongs_to :contact,-> { left_joins(:images).where(images: {imageable_type: 'Contact'}) }, foreign_key: 'imageable_id', optional: true`

#### PhoneNumber

A Phone Number record associated with contacts.

Relationship:
* `belongs_to :contact`


## Setup

### docker compose for running postgres and redis
The app contains a docker compose environment if you wish to use it to run postgres and redis. Make a copy of 
`docker-compose.override.yml` for the example file as set the ports to expose and any other needed changes.

Start the databases with `docker compose up`

### Setup the peeps database

`bundle exec rails db:setup`

This should create and seed the database with some data using faker.

## Run the app

`bundle exec rails s`

## Access the API with curl

The controllers support authentication by specifying the user name in an authentication header. For example:
```shell
curl "http://localhost:4000/v11/images?include=imageable&page%5Bsize%5D=1000" \
     -H 'Accept: application/vnd.api+json' \
     -H 'Authorization: admin1'
```

```shell
curl "http://localhost:4000/v11/contacts?include=phone-numbers&include=images&page%5Bsize%5D=15" \
     -H 'Accept: application/vnd.api+json'
```

There are some additional curl commands to access the api in the [Wiki](https://github.com/cerebris/Peeps3/wiki/Request-Examples).

## Differences by resource retrieval strategy

Currently using 'JSONAPI::ActiveRelationRetrievalV09' does not apply permissions filtering to the included resources

