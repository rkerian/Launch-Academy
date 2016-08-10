require 'pry'

board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil]
]

def print_grid(board)
  board.each_with_index do |value, index|
    if board[index][0].nil?
      print '   '
    else
      print " #{board[index][0]} "
    end

    print ' | '

    if board[index][1].nil?
      print '   '
    else
      print " #{board[index][1]} "
    end

    print ' | '

    if board[index][2].nil?
      puts '   '
    else
      puts " #{board[index][2]} "
    end

    if index == 0 || index == 1
      puts "----------------"
    end
  end
end
print_grid(board_a)
