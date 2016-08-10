CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  title TEXT,
  ingredients TEXT,
  instructions TEXT
);

CREATE TABLE comments (
  id INT REFERENCES recipes(id),
  author TEXT,
  comments TEXT
);
