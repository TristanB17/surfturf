# SurfTurf

[![Build Status](https://travis-ci.com/colinwarmstrong/whereto.svg?branch=master)](https://travis-ci.com/TristanB17/surfturf)
[![Coverage Status](https://coveralls.io/repos/github/TristanB17/surfturf/badge.svg?branch=add_coveralls)](https://coveralls.io/github/TristanB17/surfturf?branch=add_coveralls)

SurfTurf is a small app used to gather marine weather data on a desired location. The searched location can be as specific or as broad as the user would like. 

This project was built as a solo 'choose your own adventure'-type project where an API is provided, with an app then structured around it.


## Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This repository uses [Google OAuth2](https://support.google.com/googleapi/answer/6158849?hl=en) to create accounts and verify users.  A gmail account is required to login to this app. Part of the Google OAuth2 setup process involves receiving a *CLIENT ID* and a *CLIENT SECRET* from the google developer console, which are stored away in an application.yml file. There is an additional key required for the local setup process. Generation and use of these keys is outlined below in __Installation and Setup__.

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

Next, use [Figaro](https://github.com/laserlemon/figaro) to generate an `application.yml` file in the `/config` directory:

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

Once the server is up and running, visit [http://localhost:3000](http://localhost:3000) to view the homepage of the app.


## Running the tests

The test suite is built using RSpec.  After setting up the respository locally, run the following command to run the test suite:
```
bundle exec rspec
```

## Site UI

The Homepage:
![homepage1](https://i.imgur.com/QF2tugw.png)

Upon clicking 'Sign in with Google', a user is prompted to select a google account, after which they are taken to a logged in user homepage.

[!googlelogin](https://i.imgur.com/pCckExN.png)

Selecting 'new search' will present a user with a series of fields; they can fill out as many or as little as they wish, and results with provided information will still be returned.

[!newsearch](https://i.imgur.com/GTqFb0g.png)

After clicking 'search', a user will then be presented with a series of locations (or one depending on the specificity of the user's search parameters) which all share attributes of the original search. A user is able to select the intended location.

[!verifylocation](https://i.imgur.com/31Moi5l.png)

The user is then presented with weather information on the current date.

[!weatherresults](https://i.imgur.com/RGhkNrl.png)

Additional data analysis will be conducted as a part of the expansion of the app.
    
## Deployment

SurfTurf is deployed through [Heroku](https://www.heroku.com/) and hosted at [https://surfturf.herokuapp.com/](https://surfturf.herokuapp.com/).

## Built With

* [Rails 5.2.1](https://rubyonrails.org/) - Ruby based web framework
* [Postgres 1.1.3](https://www.postgresql.org/) - Relational SQL Database

## Author

**Tristan Bambauer**  
 	*[GitHub](https://github.com/TristanB17)*
 	*[LinkedIn](https://www.linkedin.com/in/tristan-bambauer/)*

## Contributing

If you would like to contribute, feel free to reach out to the author via LinkedIn.
