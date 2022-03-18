# README

This web application use geocoder gem and it is using openstreetmap by default. If you wish to work with another map engine, such as google premier, you can edit lookup property in your `root-project/config/initializers/geocoder.rb`

## GEMS

Run:

`bundle install`

## DATABASE

Enable postgis extension in your Postgre by entering in your PG console and executing this command:

`CREATE EXTENSION postgis;`

Then you can run:

`rails db:migrate`

### SEEDING

In order to load 2 zones with geometrical shape in the database use:

`rails db:seed`


## ENVIRONMENT VARIABLES
For development and test environments, create a local_env.yml and local_env_test.yml files in config folder. 

Create files in linux bash

`touch local.yml local.test.yml`

Copy and paste this variables into the files and set with your local credentials.

```
DATABASE_USER: "USERNAME"
DATABASE_PASSWORD: "PASSWORD"
```

For production, you have to provide a database url such as heroku pg *DATABASE_URL* as MY_APP_DATABASE_URL environment variable.

## SEARCHING FOR AN ADDRESS 

Open your console:

`rails console`

and run:

`Zone.ready_for_delivery?(address:"YOUR-ADDRESS-STRING")`

This method will return `true` or `false`

## POSSIBLE ERRORS
If you are deploying to heroku, you should replace "postgre://" preffix for "postgis://" in your MY_APP_DATABASE_URL value.

