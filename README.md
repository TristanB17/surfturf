# SurfTurf

[![Build Status](https://travis-ci.com/colinwarmstrong/whereto.svg?branch=master)](https://travis-ci.com/TristanB17/surfturf)

[![Coverage Status](https://coveralls.io/repos/github/TristanB17/surfturf/badge.svg?branch=add_coveralls)](https://coveralls.io/github/TristanB17/surfturf?branch=add_coveralls)

SurfTurf is a small app used to gather marine weather data on a desired location. The searched location can be as specific or as broad as the user would like. 

This project was built as a solo 'choose your own adventure'-type project where an API is provided, and an app should be constructed around it.


## Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This repository uses [Google OAuth2](https://support.google.com/googleapi/answer/6158849?hl=en) to create accounts and verify users.  A gmail account is required to login to this app. Part of the Google OAuth2 setup process involves receiving a *CLIENT ID* and a *CLIENT SECRET* from the google developer console, which are stored away in an application.yml file.  Their is an additional key required for local setup  process for generating and using this secret key is outlined below in __Installation and Setup__.

### Installation and Setup

From your terminal, clone the repository to your local machine:

```
git clone https://github.com/TristanB17/surfturf.git
```

Change into the directory:

```
cd surfturf
```

Install and update gems:

```
bundle install
bundle update
```

Setup the database:

```
rails db:{create,migrate}
```

Next, use [Figaro](https://github.com/laserlemon/figaro) to generate an `application.yml` file in `/config`:

```
bundle exec figaro install
```

Now use google developer tools to get a unique client id and client secret. They should be included in the config/application.yml file like this:

```
GOOGLE_CLIENT_ID: <YOUR_CLIENT_ID>
GOOGLE_CLIENT_ID: <YOUR_CLIENT_SECRET>
```

Replace `<YOUR_CLIENT_ID>` and `<YOUR_CLIENT_SECRET>` with the id and secret from google developer console.

Additionally, this app utilizes the [World Weather Online API](https://www.worldweatheronline.com/developer/api/docs/marine-weather-api.aspx) to collect marine weather data. You can make an account on their website and apply for a free API key (for the option `MARINE WEATHER API`, not to be confused with the `MARINE PAST WEATHER API`).

```
MARINE_KEY: <YOUR_MARINE_KEY>
```

The repository is now configured to run your local machine.  To spin up a server, run the following:

```
rails s
```

Once the server is up and running, visit [http://localhost:3000](http://localhost:3000) or any of the other endpoints to see the homepage of the app.


## Running the tests

The test suite is built using RSpec.  After setting up the respository locally, run the following command to run the test suite:
```
bundle exec rspec
```

## Site UI


    
## Deployment

Talent Buyer API is deployed through [Heroku](https://www.heroku.com/) and hosted at [https://surfturf.herokuapp.com/](https://surfturf.herokuapp.com/).

## Built With

* [Rails 5.2.1](https://rubyonrails.org/) - Ruby based web framework
* [Postgres 1.1.3](https://www.postgresql.org/) - Relational SQL Database

## Author

**Tristan Bambauer**  
 	*[GitHub](https://github.com/TristanB17)*
 	*[LinkedIn](https://www.linkedin.com/in/tristan-bambauer/)*

## Contributing

If you would like to contribute, feel free to reach out to any of the authors via email or LinkedIn.
