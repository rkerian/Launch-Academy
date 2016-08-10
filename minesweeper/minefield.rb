require_relative 'cell'

class Minefield
  attr_reader :row_count, :column_count, :field

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    @mine_count = mine_count
    @field = (Array.new(@row_count) { Array.new(@column_count) })
    @field.map do |row|
      row.map! { |x| x.nil? ? Cell.new : x }
    end
    @mine_count.times do
      @field[rand(@row_count)][rand(@column_count)].toggle_type
    end
    @mines_detonated = false
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    !@field[row][col].covered
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
    cell = @field[row][col]
    cell.uncover
    @mines_detonated = true if cell.mined

    left = @field[row][col - 1] unless col - 1 < 0
    top_left = @field[row -1][col -1] unless row -1 < 0 || col -1 < 0
    bot_left = @field[row +1][col -1] unless row + 1 > @row_count - 1 || col -1 < 0
    right = @field[row][col + 1] unless col + 1 > @column_count - 1
    top_right = @field[row -1][col +1] unless row -1 < 0 || col + 1 > @column_count - 1
    bot_right = @field[row +1][col +1] unless row + 1 > @row_count - 1 || col + 1 > @column_count - 1
    top = @field[row -1][col] unless row - 1 < 0
    bottom = @field[row +1][col] unless row + 1 > @row_count - 1

    if adjacent_mines(row, col) == 0
      left.uncover if !left.nil?
      top_left.uncover if !top_left.nil?
      bot_left.uncover if !bot_left.nil?
      right.uncover if !right.nil?
      top_right.uncover if !top_right.nil?
      bot_right.uncover if !bot_right.nil?
      top.uncover if !top.nil?
      bottom.uncover if !bottom.nil?
    end
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    @mines_detonated
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    @field.map do |row|
      row.map do |column|
        return false if column.covered
      end
    end
    true
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    left = @field[row][col - 1] unless col - 1 < 0
    top_left = @field[row -1][col -1] unless row -1 < 0 || col -1 < 0
    bot_left = @field[row +1][col -1] unless row + 1 > @row_count - 1 || col -1 < 0
    right = @field[row][col + 1] unless col + 1 > @column_count - 1
    top_right = @field[row -1][col +1] unless row -1 < 0 || col + 1 > @column_count - 1
    bot_right = @field[row +1][col +1] unless row + 1 > @row_count - 1 || col + 1 > @column_count -1
    top = @field[row -1][col] unless row - 1 < 0
    bottom = @field[row +1][col] unless row + 1 > @row_count - 1

    mines_nearby = 0
    mines_nearby += 1 if !left.clear? if !left.nil?
    mines_nearby += 1 if !top_left.clear? if !top_left.nil?
    mines_nearby += 1 if !bot_left.clear? if !bot_left.nil?
    mines_nearby += 1 if !right.clear? if !right.nil?
    mines_nearby += 1 if !top_right.clear? if !top_right.nil?
    mines_nearby += 1 if !bot_right.clear? if !bot_right.nil?
    mines_nearby += 1 if !top.clear? if !top.nil?
    mines_nearby += 1 if !bottom.clear? if !bottom.nil?
    mines_nearby
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    @field[row][col].mined
  end
end
