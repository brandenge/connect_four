require './lib/title'

class Game
  include Title

  def initialize

  end

  def start
    puts TITLE
  end
end

game = Game.new
game.start
