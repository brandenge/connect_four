require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/title'

class Game
  include Title

  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2', false)]
    @board = Board.new
  end

  def start
    print_welcome
    play_game
  end

  def play_game
    @board.initialize_board
    @board.render_board
    until game_over?
      @players.each do |player|
        break if game_over?
        @board.next_turn(player)
        @board.update
      end
    end
  end

  def game_over?
    @board.winner || @board.valid_columns.empty?
  end

  def print_welcome
    puts TITLE
    puts <<-WELCOME

      **************************************************************************

          Welcome to CONNECT FOUR

      **************************************************************************

          Please enter p to play, or q to quit.

      **************************************************************************

    WELCOME
  end
end

game = Game.new
game.start
