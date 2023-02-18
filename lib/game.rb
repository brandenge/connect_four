require './lib/title'
require './lib/board'

class Game
  include Title

  def initialize
    @board = Board.new
  end

  def start
    print_welcome
    @board.initialize_board
    @board.render_board
  end

  def print_welcome
    puts TITLE
    puts <<-WELCOME

      **************************************************************************

          WELCOME TO CONNECT 4

      **************************************************************************

          Please enter p to play. Or enter q to quit.

      **************************************************************************

    WELCOME
  end
end

game = Game.new
game.start
