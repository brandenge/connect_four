require 'date'

class Turn
  attr_reader :row,
              :col,
              :color,
              :timestamp

  def initialize(row, col, color)
    @row = row
    @col = col
    @color = color
    @timestamp = DateTime.now
  end
end
