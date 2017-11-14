# contents-api
This API allows you to scrape headings and links from webpages.

## Installation
1.	Clone the project
2.	Run > bundle install
3.  Run > rails db:migrate
4.	Run server > rails s

## Usage
List Url: http://localhost:3000/contents, GET

Scrape URL: http://localhost:3000/contents?url=[webpage-url] , POST

Headings and Links are stored in array format.

## Dependencies
Gems used are:
*	rspec-rails – Testing framework
*	factory_bot – A fixture replacement
*	database_cleaner
*	rails_controller_testing
*	nokogiri
*	valid_url
*	kaminari – Pagination for web app frameworks

## Tests
This application is fully tested. Test is done using RSpec framework.

## Questions, Feedback
Feel free to message me on Github.
