require "sinatra"
require "pg"
require 'pry'

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get '/actors' do
  @actors = db_connection { |conn| conn.exec("SELECT * FROM actors ORDER BY name ASC") }
  erb :'actors/index'
end

get '/actors/:id' do
  @actor_id = params[:id].to_i
  # @actor = db_connection { |conn| conn.exec("SELECT * FROM actors WHERE actors.id = #{@actor_id}") }
  @actor = db_connection { |conn| conn.exec("SELECT actors.name, movies.title,
    movies.year, cast_members.character, movies.id
    FROM actors INNER JOIN cast_members
    ON (cast_members.actor_id = actors.id)
    INNER JOIN movies
    ON (cast_members.movie_id = movies.id)
    WHERE actors.id = #{@actor_id}") }
  erb :'actors/show'
end

get '/movies' do
  @movies = db_connection { |conn| conn.exec("SELECT movies.title, movies.year, movies.rating, genres.name as genre,
    studios.name as studio, movies.id
    FROM movies INNER JOIN genres
    ON (movies.genre_id = genres.id)
    LEFT OUTER JOIN studios
    ON (movies.studio_id = studios.id)
    ORDER BY title ASC") }
  erb :'movies/index'
end

get '/movies/:id' do
  @movie_id = params[:id].to_i
  @movie = db_connection { |conn| conn.exec("SELECT movies.id, movies.title, movies.year, movies.rating, studios.name as studio,
    cast_members.character, actors.id as actor_id, actors.name, genres.name as genre
    FROM movies INNER JOIN cast_members
    ON (movies.id = cast_members.movie_id)
    INNER JOIN actors
    ON (actors.id = cast_members.actor_id)
    INNER JOIN genres
    ON (movies.genre_id = genres.id)
    LEFT OUTER JOIN studios
    ON (movies.studio_id = studios.id)
    WHERE movies.id = #{@movie_id}") }

  @movie_name = @movie[0]["title"]
  @movie_year = @movie[0]["year"]
  @movie_rating = @movie[0]["rating"]
  @movie_genre = @movie[0]["genre"]
  @movie_studio = @movie[0]["studio"]
  @characters = []
    @movie.each do |person|
      @characters << [person["character"], person["name"], person["actor_id"]]
    end
  erb :'movies/show'
end
