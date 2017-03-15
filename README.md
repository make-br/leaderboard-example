# Leaderboard App

This application is a Rails example designed to teach Rails to the Futures Fund Level 2 coding students.
The application is a leaderboard that keeps track of players and their scores and displays them on a cool dashboard.

# Building the app

## Getting started: Creating a new Ruby on Rails App

First, make sure you are using the correct version of Ruby and Rails. We'll do that by running the following on our terminal:

```shell
rvm get stable
rvm install 2.4
rvm use --default 2.4
gem install rails bundler --no-document
```

Now that we have Rails installed, let's use the command line again to create a new Rails app:

```shell
rails new leaderboard
cd leaderboard
```

Welcome to your new app!
Let's start it up:

```shell
rails server
```

Now, we sould be able to visit `localhost:3000/` in our browser to see the "Weclome to Rails" screen.
