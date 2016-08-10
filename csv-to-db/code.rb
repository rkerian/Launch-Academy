#YOUR CODE GOES HERE
require 'pg'
require 'csv'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

# CSV.foreach("ingredients.csv") do |row|
#   data = row.to_a
#   db_connection do |conn|
#     conn.exec("INSERT INTO ingredients (id, name) VALUES ($1, $2)", [row[0], row[1]])
#   end
# end

ingredients = db_connection { |conn| conn.exec("SELECT id, name FROM ingredients") }

ingredients.each do |ingred|
  puts "#{ingred["id"]}. #{ingred["name"]}"
end
