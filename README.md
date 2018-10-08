# Coffee-Finder

A small Ruby API application providing an endpoint which takes a GPS latitude and longitude and spits out the names of coffee shops around that location grouped by their postcode as JSON.

## Installation
* Install a ruby version manager: `curl -sSL https://get.rvm.io | bash -s stable`
* Install ruby 2.5.1 `rvm install 2.5.1`
* Install dependencies: `bundle install`

## Run the tests
```
MAPBOX_TOKEN=your_mapbox_token_here bundle exec rspec -- spec
```

## Start server locally
```
MAPBOX_TOKEN=your_mapbox_token_here  bundle exe rails s
```
Check it works on [localhost:3000/find/coffee_shops](http://localhost:3000/v1/find/coffee_shops?longitude=43&latitude=13)

## Deploy (to production)
```
git push heroku master
```
