require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/title'

class Game
  include Title

  def initialize
    @players = [Player.new('Player 1', :blue), Player.new('Player 2', :red, false)]
    @board = Board.new
  end

  def start
    print_welcome
    play_game
  end

  def play_game
    @board.render
    until game_over?
      @players.each do |player|
        break if game_over?
        @board.next_turn(player)
        @board.update
        if !player.is_human?
          sleep(1)
          puts '******* Beep Boop Bop *******'
          sleep(1)
        end
        @board.render
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
