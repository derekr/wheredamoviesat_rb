require 'sinatra'
require 'foursquare2'

get '/' do
  client = Foursquare2::Client.new(:client_id => 'AJ5B4KWNYX5MCTWPQJYA5WCTICID404HBRX04BDMM1SDSMNI', :client_secret => 'GPKCG2YQNVTFPJN5OGE5JMCGQ1WOVDKGSPJCYDRPTQTZYOBJ')
  @result = client.search_venues(:near => 'San Francisco, CA', :categoryId => '4bf58dd8d48988d17f941735')
  @venues = @result["groups"].first["items"]
  erb :index
end