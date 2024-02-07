# Peeps 3

This is a simple test app for testing [JSONAPI::Resources](https://github.com/cerebris/jsonapi-resources).

It supports the three different resource retrieval strategies under different namespaces, V09, V10, V11.

It is currently setup to use JR from a local directory that is a sibling of where this is checked out, but this can of course be changed in the Gemfile.

The database can be seeded with a fairly large set of data.

The controllers support authentication by specifying the user name in an authentication header. For example:
```shell
curl "http://localhost:4000/v11/images?include=imageable&page%5Bsize%5D=1000" \
     -H 'Accept: application/vnd.api+json' \
     -H 'Authorization: admin1'
```

## Setup

### docker compose for running postgres and redis
The app contains a docker compose environment if you wish to use it to run postgres and redis. Make a copy of `docker-compose.override.yml` for the example file as set the ports to expose and any other needed changes.

Start the databases with `docker compose up`

### Setup the peeps database

`bundle exec rails db:setup`

This should create and seed the database with some data using faker.

## Run the app

`bundle exec rails s`

## Access the API with curl

```shell
curl "http://localhost:4000/v11/contacts?include=phone-numbers&include=images&page%5Bsize%5D=15" \
     -H 'Accept: application/vnd.api+json'
```

## Differences by resource retrieval strategy

Currently using 'JSONAPI::ActiveRelationRetrievalV09' does not apply permissions filtering to the included resources

