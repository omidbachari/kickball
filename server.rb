require 'sinatra'
require 'csv'
require 'pry'

all_player_data = []

CSV.foreach('lackp_starting_rosters.csv', headers: true) do |player_data|
  all_player_data << player_data.to_hash

end

get '/' do
  @all_player_data = all_player_data
  erb :index
end

get '/teams' do
  @all_player_data = all_player_data
  erb :teams
end

get '/positions' do
  @all_player_data = all_player_data
  erb :positions
end
