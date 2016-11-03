# BASIC SETUP

This README file is going to assume that you have a Bitbucket account for the Thresher IT department, and that you have Rails (including Bundler, Rubygems, and Ruby), Git, Mysql, and Node installed and configured on your system, or have a VM set up with the same.  If you don't, please see [Carel Strey](cstrey@alopias.com) and if you're on Windows may God help you.

Clone this repo from bitbucket if you haven't already. As of October 2016, this can be accomplished by opening your terminal, navigating to your favorite Threshery folder, and running `git clone http://YOUR-NAME-HERE@bucket.alopias.com:7990/scm/rail/railstest.git` (TODO: update the url if/when repo moves to a non-test repository).

Run the following commands in your terminal, one at a time:

  `bundle install`
  `cp config/initializers/qbwc.rb.template config/initializers/qbwc.rb`
  `cp config/secrets.yml.template config/secrets.yml`
  `cp config/database.yml.template config/database.yml`

At this point, you should open the config/database.yml file and change the lines corresponding to `username`, `password`, and `socket` to match your local mysql development. You can verify your configuration and finish this setup by typing into your console:

   `rails db:setup`

If this completes without errors, you're good to go! In your local environment, you can run the application now from the command line by running:

  `rails s` (or `rails server`, if you're not into the whole brevity thing)

Now open your browser to the location specified in the console, typicially [http://localhost:3000](http://localhost:3000)


# A NOTE REGARDING ADDRESSES
Quickbooks is lame. This statement applies broadly to their dealing with addresses.

In order to create an interface that would change "Ship To" addresses, we would need the data found in the "Ship to adddress" array within the Customer Query response data.