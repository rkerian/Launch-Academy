require "sinatra"
require "pg"
require_relative "./app/models/article"

set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

  get "/" do
    'Main Page'
  end

  get "/articles" do
    @stored_articles = db_connection { |conn| conn.exec("SELECT title, description, url FROM articles")}
    erb :articles
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    article_title = params['article_title']
    article_body = params['Description']
    article_url = params['url']

    db_connection do |conn|
      conn.exec_params("INSERT INTO articles (title, description, url) VALUES ($1, $2, $3)", [article_title, article_body, article_url])
    end
    redirect "/articles"
  end
