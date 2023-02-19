require 'date'

class Turn
  attr_reader :player, 
              :column, 
              :timestamp
  def initialize(player, column)
    @player = player
    @column = column
    @timestamp = DateTime.now
  end
end
