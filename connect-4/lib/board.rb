require_relative 'position'
require 'pry'

class Board

  attr_reader :board

  def initialize
    # 6 vertical rows, 7 horizontal columns
    @board = (Array.new(6) { Array.new(7) })
    board.map do |row|
      row.map!{ |x| x.nil? ? Position.new : x }
    end
  end

  def drop_piece(player, column)
    row_array = []
    #first check to make sure column is not full
    if !self.column_full?(column)
      @board.each_with_index do |row, index|
        #not full, so go through each row (there are six)
        #go to specified column in that row and see if it is occupied
        #if it is not, add the index of that row to the array of un-occupied rows
        row_array << index if !row[column].occupied?
      end
      #player's piece "dropped" into last empty row for the specified column
      @board[row_array.last][column].fill_position(player)
    else
      puts "Column is full."
    end
  end

  def column_full?(column)
    # return_value = true
    @board.map do |row|
      if !row[column].occupied?
        return false
      end
    end
    true
  end

  def board_full?
    count = 7
    # return_value = true
    while count > 0
      count -= 1
      return false if !self.column_full?(count)
    end
    # return_value
    true
  end

  def print_board
      @board.map do |row|
        print "| "
        row.map do |position|
          if !position.occupied?
            print " _ "
          else
            print " " + position.name + " "
          end
        end
        puts " |"
      end
    puts "|  A  B  C  D  E  F  G  |"
    "game board care of your friend print_board"
  end

end
