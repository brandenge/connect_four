require 'date'

class Turn
  attr_reader :player,
              :row,
              :col,
              :timestamp

  def initialize(player, row, col)
    @player = player
    @row = row
    @col = col
    @timestamp = DateTime.now
  end
end
