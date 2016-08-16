require "sinatra"
require "pg"

configure :development do
  set :db_config, { dbname: "grocery_list_development" }
end

configure :test do
  set :db_config, { dbname: "grocery_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

def all_groceries
  all = nil
  db_connection do |conn|
    all = conn.exec("SELECT name FROM groceries;")
  end
  all
end

def create_grocery(name)
  db_connection do |conn|
    sql_query = "INSERT INTO groceries (name) VALUES ($1)"
    conn.exec_params(sql_query, [name])
  end
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = all_groceries
  erb :groceries
end

post "/groceries" do
  name = params[:name]
  create_grocery(name) unless name.strip.empty?
  redirect "/groceries"
end

# code for "Exceeds Expectations" requirements should go below this line.
