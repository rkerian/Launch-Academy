require_relative 'movie.rb'
require 'pry'
require 'time'

my_movies = [
  Movie.new('The Princess Bride', :Comedy, '7:00PM'),
  Movie.new('Troll 2', :Horror, '7:30PM'),
  Movie.new('Pet Cemetery', :Horror, '8:15PM'),
  Movie.new('Flight of the Navigator', :Adventure, '8:17PM'),
  Movie.new('Teen Witch', :Comedy, '8:20PM'),
  Movie.new('The Goonies', :Comedy, '8:30PM'),
  Movie.new('Better Off Dead', :Comedy, '8:45PM'),
  Movie.new('Weekend at Bernies', :Comedy, '9:00PM'),
  Movie.new('The Wizard', :Adventure, '9:10PM')
]
# binding.pry
