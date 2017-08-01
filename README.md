# Welcome to City Race
## Create your own urban scavenger hunt and invite teams to play!

CityRacers is a custom scavenger hunt app. Users can create a custom urban hunt and add location-specific clues as well as photo and video challenges, then invite teams and their members to join using a pre-set access code. Once a hunt is live, teams can open the app on a mobile device to compete against other teams to answer clues that lead to other clues and eventually the finish line. 

### This app is currently in development and offers limited functionality at this time.

Tech stack: Rails, React, Bootstrap, PostgreSQL, RSpec, Capybara, Selenium, Factory Girl, Travis CI, Heroku

To set up your local environment and/or contribute:

Note: If you'd like to contribute, please fork the project and submit a pull request with your contribution.

Clone the repository
`$ git clone https://github.com/somedayrainbows/city_race.git `

cd into the project's directory
`$ cd city_race `

Install the included gems
`$ bundle `

Install RSpec
`$ rails g rspec:install `

Create, setup and seed the database to set up the database locally and seed it with clues, hunts, and users.
`$ bundle exec rake db:{create,migrate,seed} `

Run the application in the dev environment
`$ rails s `

Visit the dev environment on localhost:
`http://localhost:3000/ `
