require 'sinatra'
require 'csv'
require 'pry'


all_player_data = []

CSV.foreach('lackp_starting_rosters.csv', headers: true) do |player_data|
  all_player_data << player_data.to_hash
end

get '/' do
  erb :index
end

get '/teams/:team' do
  @team = params[:team]
  @all_player_data = all_player_data
    all_player_data.each do |player_data|
      player_data[:team]
    end
erb :teams
end


get '/positions/:position' do
  @all_player_data = all_player_data
  erb :positions
end
