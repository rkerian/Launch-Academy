class Player

  attr_reader :name

  COLUMN_TRANSLATION = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize
    puts "What is your name?"
    @name = gets.strip
  end

  def take_turn(board)
    print "#{@name}, please select a column (A - G) to drop your piece in >"
    column = gets.strip.upcase
    if COLUMN_TRANSLATION.include?(column)
      translated_column = COLUMN_TRANSLATION.find_index(column)
      board.drop_piece(@name, translated_column)
      board.print_board
    else
      puts "Invalid choice. Try again."
      self.take_turn(board)
    end
  end
end
