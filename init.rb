require 'sinatra'
require 'sinatra/json'
require 'foursquare2'

get '/' do
  client = Foursquare2::Client.new(:client_id => 'AJ5B4KWNYX5MCTWPQJYA5WCTICID404HBRX04BDMM1SDSMNI', :client_secret => 'GPKCG2YQNVTFPJN5OGE5JMCGQ1WOVDKGSPJCYDRPTQTZYOBJ')
  @venues_result = client.search_venues(:near => 'San Francisco, CA', :categoryId => '4bf58dd8d48988d17f941735')
  @venues = @venues_result["groups"].first["items"]

 # @events = client.venue_events(@venues.first["id"])
  # 4dfb90c6bd413dd705e8f897 // events category id

  erb :index
end

get '/venue/:venue_id/movies' do
  client = Foursquare2::Client.new(:client_id => 'AJ5B4KWNYX5MCTWPQJYA5WCTICID404HBRX04BDMM1SDSMNI', :client_secret => 'GPKCG2YQNVTFPJN5OGE5JMCGQ1WOVDKGSPJCYDRPTQTZYOBJ')

  @events_result = client.venue_events(params["venue_id"])

  json @events_result["events"]["items"]
end