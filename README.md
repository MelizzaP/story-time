Let's Tell a Tale
=================

[![Build Status](https://travis-ci.org/MelizzaP/story-time.svg?branch=master)](https://travis-ci.org/MelizzaP/story-time)


Let's Make a Story is a web application that allows users to collaborate through creating a story one word or sentence at a time.

---

### Technologies Used
  Server-side: Ruby on Rails, Devise, PostgreSQL
  Client-side: JavaScript, JQuery
  Testing: Rspec, TravisCI
  Deployment: Heroku

### Installation
Run the following commands in your terminal
```
  git clone git@github.com:MelizzaP/story-time.git story_time
  cd story_time
  bundle install
```
Create a database by running
```
  bundle exec rake db:create db:migrate
```
  
Run locally(localhost:3000)
```
  rails server
```
  
Run test suite
```
  bundle exec rspec
```
  
The app is also currently deployed on heroku at (https://warm-plains-8420.herokuapp.com)  
  
---
Requirements
------------

#### Ruby version
2.1.3p242 (2014-09-19 revision 47630)

#### Dependencies
```
  byebug
  capybara
  coffee-rails (~> 4.1.0)
  database_cleaner
  devise
  factory_girl_rails
  jbuilder (~> 2.0)
  jquery-rails
  pg
  rails (= 4.2.0)
  rails_12factor
  rake
  rspec-rails
  sass-rails (~> 5.0)
  sdoc (~> 0.4.0)
  spring
  turbolinks
  uglifier (>= 1.3.0)
  web-console (~> 2.0)
```  

---
Plans for the Future
--------------------
* Create a method for Generating a title 
* Add styling elements to the front end
* Add logic to determine whether user is entering actual English Words/Sentences
* Add ability to add pictues as well as words
* Create a voting system for users to collectively decide to end a tale
* Dynamic styling to update tale content without reloading the page



<tt>rake doc:app</tt>.
