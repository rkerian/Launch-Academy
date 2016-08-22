require 'sinatra'
require_relative 'config/application'
require 'faker'
require 'pry'

Dir['app/models/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups_list = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @mu = Meetup.find_by(id: params[:id])
  @mu_creator = User.find_by(id: @mu.creator)
  erb :'meetups/show'
end

get '/meetups/create' do
  @current_user = current_user
  erb :'meetups/create'
end

post '/meetups/create' do
  Meetup.create(params)
  redirect '/'
end

post '/meetups/:id/join' do
  Memberships.create(meetup_id: params[:id], user_id: current_user.id)
  redirect 'meetup/#{params[:id]}'
end

post '/meetups/:id/leave' do
  user = Memberships.find_by(meetup_id: params[:id], user_id: current_user.id)
  user.delete
  redirect "/meetup/#{params[:id]}"
end
