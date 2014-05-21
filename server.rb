require 'sinatra'
require 'csv'
require 'pry'


all_player_data = []

CSV.foreach('lackp_starting_rosters.csv', headers: true) do |player_data|
  all_player_data << player_data.to_hash
end

get '/' do
  @teams = []
  all_player_data.each do |player|
    if !@teams.include?(player["team"])
      @teams << player["team"]
    end
  end

  @positions = []
  all_player_data.each do |position|
    if !@positions.include?(position["position"])
      @positions << position["position"]
    end
  end

  erb :index
end

get '/teams/:team' do

all_player_data

  @team = params[:team]
  @all_player_data = all_player_data
    all_player_data.each do |player_data|
      player_data[:team]
    end
erb :teams
end


get '/positions/:position' do

all_player_data

  @position = params[:position]
  @all_player_data = all_player_data
    all_player_data.each do |player_data|
      player_data[:position]
    end
erb :positions
end
