require 'sinatra'
require 'csv'
require_relative "app/models/television_show"
require "sinatra/flash"
require 'pry'

set :views, File.join(File.dirname(__FILE__), "app/views")

enable :sessions

get '/television_shows' do
  erb :index
end

get '/television_shows/new' do
  erb :new
end

post '/television_shows/new' do
  title = params[:title]
  network = params[:network]
  starting_year = params[:starting_year]
  synopsis = params[:synopsis]
  genre = params[:genre]

  if title == "" || network == "" || starting_year == "" || synopsis == ""
    flash[:notice] = "Please fill in all required fields"
    redirect '/television_shows/new'

  else
    CSV.open('television-shows.csv', 'at') do |csv|
      csv << [title, network, starting_year, synopsis, genre]
    end
    redirect '/television_shows'
  end
end
