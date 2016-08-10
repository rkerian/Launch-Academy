require 'sinatra'
require 'erb'
require 'CSV'
require 'pry'

get "/" do
  'Main Page'
end

get "/articles" do
  @stored_articles = CSV.read("data/articles.csv")
  erb :articles
end

get "/articles/new" do
  erb :new
end

post "/articles" do
  article_title = params['article_title']
  article_body = params['article_body']
  article_url = params['article_url']
  article_entry = [article_title, article_body, article_url]

  CSV.open("data/articles.csv", "at") do |csv|
    csv << article_entry
    #may need to have article_entry in []
  end
  redirect "/articles"
end
