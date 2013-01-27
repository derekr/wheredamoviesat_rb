require 'sinatra'
require 'sinatra/json'
require 'foursquare2'

@default_location = 'San Francisco, CA'

def get_client
  Foursquare2::Client.new(
    :client_id => ENV['FOURSQUARE_ID'],
    :client_secret => ENV['FOURSQUARE_SECRET']
  )
end

get '/' do
  erb :index
end

get '/venues' do
  client = get_client()
  @venues_result = client.search_venues(
    :near => params['location'],
    :categoryId => '4bf58dd8d48988d17f941735'
  )
  
  json @venues_result["groups"].first["items"]
end

get '/venue/:venue_id/movies' do
  client = get_client
  @events_result = client.venue_events(params["venue_id"])

  json @events_result["events"]["items"]
end