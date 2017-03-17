# Leaderboard App

This application is a Rails example designed to teach Rails to the Futures Fund Level 2 coding students.
The application is a leaderboard that keeps track of players and their scores and displays them on a cool dashboard.

![Screenshot of leaderboard](https://raw.githubusercontent.com/TheFuturesFund/leaderboard-example/master/public/screenshot.png)

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
curl -o app/assets/stylesheets/scaffolds.scss https://raw.githubusercontent.com/TheFuturesFund/leaderboard-example/master/app/assets/stylesheets/scaffolds.scss
curl -o public/background.jpg https://raw.githubusercontent.com/TheFuturesFund/leaderboard-example/master/background.jpg
```

Next, let's add some custom fonts from [Google Fonts](https://fonts.google.com). Go to `app/views/layouts/application.html.erb` and find where the stylesheets are included. There add a line to include fonts:

```erb
<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
<!-- Add this line -->
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
```

## Keeping Score

Now that we have players, let's start keeping track of their scores.
To do this, we're going to generate another scaffold for scores:

```shell
rails generate scaffold Score points:integer player:references
```

If it asks you to overwrite `scaffold.scss`, type `n` and hit Enter to say no.

Adding this new migration implies changes to our database so we'll need to run the migrations:

```shell
rails db:migrate
```

Now, we can start our server with `rails server` and visit `localhost:3000/scores`.
There we can add, edit, view, and delete scores.

When we go to add a new score, the "Player" attribute is set by a text field.
This is because our Score model uses the id of a Player record to set up this relationship.
In this field, we can type the id of a Player record to associate it with our score.

To make this a bit more straightforward, let's add a collection select.
Go to `app/view/scores/_form.html.erb` and find this:

```erb
<div class="field">
  <%= f.label :player_id %>
  <%= f.text_field :player_id %>
</div>
```

...and replace it with this:

```erb
<div class="field">
  <%= f.label :player_id %>
  <%= collection_select :score, :player_id, Player.all, :id, :name %> 
</div>
```

Now, if we go to create or edit a player, we should see a helpful dropdown instead of a text field.

Next, if we look at the score in the index or show view, we'll see that it looks something like `<Player:0x123abc>`.
Let's change that to the player's name.

Got to `app/views/scores/index.html.erb` and `app/views/scores/show.html.erb` and replace instances of `@score.player` or `score.player` with `@score.player.name` or `score.player.name` respectively.

```erb
<!-- Before -->

<td><%= score.player %></td>
<%= @score.player %>

<!-- After -->

<td><%= score.player.name %></td>
<%= @score.player.name %>
```

Now let's sort our Score models by how many points they have.
We do this by updating the `index` method in `app/controllers/scores_controller.rb`

```ruby
def index
  @scores = Score.order(points: :desc)
end
```

Now if we look at our list of scores, we should see them sorted by how many points there are.
Let's put the finishing touch on that view by going to `app/views/scores/index.html.erb` and changing...

```erb
<h1>Scores</h1>
```

to...

```erb
<h1>Leaderboard</h1>
```

## Routing

Our leaderboard looks pretty good now, but we have to know to go to `/scores` or `/players` to see anything.
Let's fix that.

First, we'll want to set the root route.
This is the route that is used when we look at our site without a path.
We set this by adding a line to `config/routes.rb`.

```ruby
root to: "scores#index"
```

Now when we go to `localhost:3000/`, we should see our leaderboard instead of the "Welcome to Rails" screen!

Now, let's add some navigation so we can move between views without changing the URL.
In `app/views/layouts/application.html.erb`, let's add some links inside the body tag underneath the `<%= yield %>` line.

```erb
<p>
  <%= link_to "Player", players_path %> | 
  <%= link_to "Leaderboard", scores_path %>
</p>
```

Now we should see some helpful navigation links in our views!
