require 'sinatra'
require 'pry'
require "sinatra/flash"
require_relative 'models/game.rb'

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get '/' do
  if session[:visit_count].nil?
    session[:visit_count] = 1
    session[:player_score] = 0
    session[:ai_score] = 0
    #keeping win count separately from number of visits
  else
    session[:visit_count] += 1
  end

  if session[:player_score] >= 2
    session[:player_score] = 0
    session[:ai_score] = 0
    flash[:notice] = "You chose #{session[:player_choice]} and the Computer chose #{session[:ai_choice]}. You won the GAME!"
    redirect '/'

  elsif session[:ai_score] >= 2
    session[:player_score] = 0
    session[:ai_score] = 0
    flash[:notice] = "You chose #{session[:player_choice]} and the Computer chose #{session[:ai_choice]}. The Computer won the GAME!"
    redirect '/'

  else
    #keep playing
    erb :index
  end
end

post '/choose' do
  @ai_choice = ["Rock", "Paper", "Scissors"].sample
  session[:result] = Game.process_turn(params[:choice], @ai_choice)
  session[:ai_choice] = @ai_choice
  session[:player_choice] = params[:choice]

    if session[:result] == 0
      flash[:notice] = "You chose #{params[:choice]}. Computer chose #{@ai_choice}. Computer wins the round."
      session[:ai_score] += 1
    elsif session[:result] == 1
      flash[:notice] = "You chose #{params[:choice]}. Computer chose #{@ai_choice}. You win the round."
      session[:player_score] += 1
    else
      flash[:notice] = "You chose #{params[:choice]}. Computer chose #{@ai_choice}. Round tied."
    end
    redirect '/'
end
