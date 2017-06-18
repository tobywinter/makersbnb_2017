# MakersBnB

The first experience of a group project at Makers Academy (Week 6).

Contributors to this repo:

- Dom McDonnell [@dmcd84](https://github.com/dmcd84)
- Elena Morton [@elenamorton](https://github.com/elenamorton)
- Lubos Michalic [@lubosmichalic](https://github.com/lubosmichalic)
- Toby Hasler-Winter [@tobywinter](https://github.com/tobywinter)

## Approach

**For this project we plan to use:**

- AGILE methodologies and XP values

**Technologies**
- Waffle.io for project management
- Github(obviously!)
- Sinatra for our controller with erb views
- Ruby models


**Future actions - if more time were available**
- JavaScript and React to implement interactive elements to our user interface
- Mailgun API for email notifications upon action completions (e.g. booking confirmation)

## Specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.
Headline specifications

 * Any signed-up user can list a new space.
 * Users can list multiple spaces.
 * Users should be able to name their space, provide a short description of the space, and a price per night.
 * Users should be able to offer a range of dates where their space is available.
 * Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
 * Nights for which a space has already been booked should not be available for users to book that space.
 * Until a user has confirmed a booking request, that space can still be booked for that night.

 ### User stories the team extracted from the Specification:

**Any signed up user can list a new space**
```
As a person
So I can list a space
I want to sign up to makersbnb

As a user(host)
So I can make some money
I want to list a new space
```
**User can list multiple spaces**
```
As a user(host)
So I can expand my empire
I want to list multiple spaces
```
**Users should be able to name their space, provide a short description of the space, and a price per night**
```
As a user(host)
To entice people to rent my space
I want to provide them useful information of name, description and price for my space
```
**Users should be able to offer a range of dates where their space is available**
```
As a user(host)
So that people can see if the space is free when they want to rent it
I want to display the dates that it is available
```
**Any signed-up user can request to hire any space for one night and this should be approved by the user that owns that space.**
```
As a user(guest)
So that I can book a space for a night
I want to be able to submit a request to hire a space to the owner

As a user(host)
So that I can rent my space for a night
I want to be able to approve a request from another user to rent
```
**Nights for which a space has already been booked should not be available for users to book that space**
```
As a user(guest)
So I don’t request to hire a space thats already reserved
I want booked nights to be marked as unavailable
```
**Until a user has confirmed a booking request, that space can still be booked for that night.**
```
As a user(guest)
So I don’t miss out on a space
I want to be able to request to hire a space that already has been requested by another user

As a user(host)
So I can select which booking to confirm
I want to see multiple booking requests for any given date

As user(host)
So I don’t get confused by leftover requests once I have selected one to approve
I want to decline a request to hire
```
**Once a user has an account, they can log in and log out**
```
As a user(either)
So I can rent or hire spaces as myself online
I want to log in to my account

As a user(either)
So that no-one else uses my account to rent or hire spaces
I want to log out of my account
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/tobywinter/makersbnb_2017
$ cd makersbnb
$ rvm 2.4.0
$ bundle install
```
* run tests
```shell
$ rspec
```
* start up sinatra
```shell
$ rackup -p 4567
```
* in your browser, navigate to http://localhost:4567/
