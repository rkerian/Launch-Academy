/* displays total number of recipes */
SELECT COUNT(id) FROM recipes;

/*displays total number of comments */
SELECT COUNT(id) FROM comments;

/* displays total number of comments for particular recipe, in this case, recipe 1 */
SELECT COUNT(*)
 FROM comments
 WHERE id = 1;

/* displays name of recipe for each comment */
SELECT title
  FROM recipes
  JOIN comments ON
  recipes.id = comments.id;

/* add recipe and two comments
INSERT INTO recipes (title, ingredients, instructions) VALUES ('Brussels Sprouts with Goat Cheese', 'brussels sprouts, goat cheese', 'eat together and enjoy');
*/

/* check id of Brussels Sprouts with Goat Cheese
SELECT id
  FROM recipes
  WHERE title = 'Brussels Sprouts with Goat Cheese';
*/

/* We now know that id of Brussels Sprouts and Goat Cheese is 12, so lets add comments */
INSERT INTO comments (id, author, comments) VALUES (12, 'Ryan Kerian', 'great recipe');
INSERT INTO comments (id, author, comments) VALUES (12, 'Launch User', 'okay recipe');
