require 'json'
require 'sinatra'
require 'data_mapper'

#configure sinatra
configure :development do
  DataMapper::Logger.new($stdout, :debug)
  set :protection, :except => [:http_origin]
end

configure :production do
end

configure do
  DataMapper.setup(:default, 'sqlite:db/harddrivesapp.db')
  #set :environment, "production"  # very important otherwise cannot connect to server, even on local network!
  set :public_folder, File.dirname(__FILE__) + '/public/app'
  set :port, 4568
end

# allow-origin on all returned responses.
before do
  content_type :json  
  headers "Access-Control-Allow-Origin" => "*", 
          "Access-Control-Allow-Headers" => "Origin, X-Requested-With, Content-Type, Accept",
          "Access-Control-Allow-Methods" => "GET, POST, PUT, DELETE, OPTIONS"
end

require './models/harddrive.rb'
require './models/event.rb'
require './routes/harddrives.rb'
require './routes/events.rb'
DataMapper.finalize


