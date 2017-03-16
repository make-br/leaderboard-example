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

## Scaffolds: Add players

Our leaderboard needs a list of players.
To make one, we're going to generate a "scaffold".
We do this on our terminal:

```shell
rails generate scaffold Player name:string
```

Generating the new scaffold implies changes to our database.
Let's run some commands to create and then migrate the database.

```shell
rails db:create
rails db:migrate
```

Now, we should be able to fire up our app with `rails server` and navigate to `localhost:3000/players`.
We should be able to add, view, edit, and delete players there.

## Styles: Let's add some

Now we have an app, but it looks kind of plain.
Let's add some styles.

We covered HTML/CSS last session, so we're not going to spend too much time here.
We have some styles premade.

First, let's download the files we need:

```shell
curl -o app/assets/stylesheets/scaffolds.scss https://raw.githubusercontent.com/TheFuturesFund/leaderboard-example/master/app/assets/stylesheets/scaffolds.css
curl -o public/background.jpg https://raw.githubusercontent.com/TheFuturesFund/leaderboard-example/master/background.jpg
```

Next, let's add some custom fonts from [Google Fonts](https://fonts.google.com). Go to `app/views/layouts/application.html.erb` and find where the stylesheets are included. There add a line to include fonts:

```erb
<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
<!-- Add this line -->
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
```
