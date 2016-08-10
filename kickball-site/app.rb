require "sinatra"
require_relative "models/player"
require_relative "models/team"
require 'erb'


#Main page
get "/" do
  "<h1>The LACKP Homepage<h1>"
end

#Teams page
get "/teams" do
  @team_hash = TeamData.to_h
  erb :teams
end

get "/teams/:team_name" do
  "Team Page for #{params[:team_name]}"
  @team_name = params[:team_name]
  @team_hash = TeamData.to_h
  @team_data = @team_hash["#{@team_name}"]
  erb :show
end

get "/positions" do
  @team_hash = TeamData.to_h
  erb :positions
end
