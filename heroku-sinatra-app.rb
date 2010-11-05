# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require 'mongo_mapper'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot
  
  MongoMapper.connection = Mongo::Connection.new(ENV['MONGOHQ_URL'])
  MongoMapper.database = 'development'
  MongoMapper.database.authenticate('hunkybill', 'wong911')
  
  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

# Quick test
get '/' do
  haml :index
end

# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
