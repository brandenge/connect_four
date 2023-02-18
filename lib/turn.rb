require 'date'

class Turn
  def initialize(player, column)
    @player = player
    @column = column
    @timestamp = DateTime.now
  end
end
