require 'pry'
require_relative 'board.rb'
require_relative 'position.rb'
require_relative 'player.rb'

# board: 7 across x 6 down
# round: each player goes once
# each player: prompted to enter name, must enter name
# each player: selects a column to drop piece, piece "drops" to last available slot
# column must be valid (i.e. 1-7), piece goes to first available row, cycle to next player
# on full column, notify player and re-select
# on win, notify player (vertical or horizontal line of four consecutive pieces wins)
# on stalemate (full board, with no win) ask if players wish to playa gain, keep same players but clear board

# board = Board.new

def start(board = Board.new)
  puts "Welcome to Connect Four."
  puts "You're up, player one."
  player_one = Player.new
  puts "You're up, player two."
  player_two = Player.new
  puts "This is your initial game board:"
  board.print_board
  run_game(board, player_one, player_two)
end

def run_game(board, player_one, player_two)

  while won?(board) == nil && !stalemate?(board)
    player_one.take_turn(board)
    player_two.take_turn(board)
  end

  if won?(board) == player_one.name
    puts "#{player_one.name} won!"
    retry_game?(player_one, player_two)
  elsif won?(board) == player_two.name
    puts "#{player_two.name} won!"
    retry_game?(player_one, player_two)
  elsif stalemate?(board)
    puts "Stalemate!"
    retry_game?(player_one, player_two)
  end
end

def retry_game?(board = Board.new, player_one, player_two)
  print "New game with same players? New game? Quit? s/n/q >"
  answer = gets.strip.downcase
  if answer == 's'
    "New game with same players!"
    board = Board.new
    board.print_board
    run_game(board, player_one, player_two)
  elsif answer == 'n'
    "Totally new game!"
    start
  else
    puts "Goodbye."
  end
end

def won?(board)
  horizontal_winner = nil
  #logic to deal with horizontal wins across rows
  board.board.map do |row|
    index = 0
    test_array = []
    while index <= 3 && horizontal_winner == nil
      test_array << row[index]
      test_array << row[index + 1]
      test_array << row[index + 2]
      test_array << row[index + 3]
      index += 1
      if test_array[0].name == test_array[1].name &&
         test_array[1].name == test_array[2].name &&
         test_array[2].name == test_array[3].name
          #we have a win condition
          horizontal_winner = test_array[0].name
      end
    end
  end

  #logic to deal with vertical wins up/down column
  #rows are 0 to 5, columns are 0 to 6
  vertical_winner = nil
  current_column = -1
  7.times do
    current_column += 1
    start_row = -1
    3.times do
      start_row += 1
      second_row = start_row + 1
      third_row = start_row + 2
      fourth_row = start_row + 3
      next if !board.board[start_row][current_column].occupied?
      if board.board[start_row][current_column].name == board.board[second_row][current_column].name &&
        board.board[second_row][current_column].name == board.board[third_row][current_column].name &&
        board.board[third_row][current_column].name == board.board[fourth_row][current_column].name
          return vertical_winner = board.board[start_row][current_column].name
      end
    end
  end
  horizontal_winner || vertical_winner
end

def stalemate?(board)
  if board.board_full? && !won?(board)
    true
  else
    false
  end
end
