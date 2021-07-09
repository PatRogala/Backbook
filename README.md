# Backbook
The Backbook is my newest project in which I summarized my Rails skills. The auth system operates on the Devise gem. Users can invite each other to their friend-list. They can create posts, comments, like posts, add profile photo using Gravatar. Also in dev mode users can sign in using Facebook (does not work in live mode on Heroku for security reasons (SSL)) and send test welcome email using letter-opener gem.

[Live demo](https://backboook.herokuapp.com/posts/2)

Test account: test@test.com : 123456

## Install

### Clone the repository

```shell
git@github.com:PatRogala/Backbook.git
cd project
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Set environment variables

To use Facebook sign-in you need to set up 2 variables:

```shell
export FACEBOOK_APP_ID=<your app id>

export FACEBOOK_APP_SECRET=<your app secret>
```

### Initialize the database

```shell
rails db:migrate
```

## Serve

```shell
rails s
```

## Features

* Sign-in system made with Devise
* Inviting users to friend-list
* Creating posts
* Comenting posts
* Timeline on main page
* Sign-in with Facebook using OmniAuth
* Mailer with welcome email
