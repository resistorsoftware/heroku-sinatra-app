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
  
  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

class LogEntry
  include MongoMapper::Document
  key :message, String
  timestamps!
end

# Quick test
get '/' do
  MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', 27076)
  db = MongoMapper.database = 'app341300'
  MongoMapper.database.authenticate('app341300', '91akyn5lsuzlqt1mp2t3e2')
  @entries = LogEntry.all
  haml :index
end

post '/add_entry' do
  entry = params[:entry]
  LogEntry.create(:message => entry)
  content_type :json
  {:entry => entry}.to_json
end

# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
