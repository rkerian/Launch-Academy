require 'pg'
require 'faker'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE
def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

TITLES.each do |title|
  db_connection do |conn|
    conn.exec_params("INSERT INTO recipes (title, instructions, ingredients) VALUES ($1, $2, $3)", [title, Faker::Lorem.paragraph, Faker::Lorem.sentences(5)])
  end
end

counter = 1;
11.times do
  db_connection do |conn|
    conn.exec_params("INSERT INTO comments (id, author, comments) VALUES ($1, $2, $3)", [counter, Faker::Name.name, Faker::Lorem.sentence])
  end
  counter += 1
end
