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
    render_welcome
    render_menu
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
    if @board.valid_columns.empty?
     puts "Wow, its a draw... try again!"
    else
      puts "..."
      sleep(1)
     puts "Congratulations #{@board.winner.name}, you have won!!!"
    end
  end

  def game_over?
    @board.winner || @board.valid_columns.empty?
  end

  def render_welcome
    puts TITLE
    puts <<-WELCOME

      **************************************************************************

          Welcome to CONNECT FOUR

      **************************************************************************

    WELCOME
  end

  def render_menu
    puts "\n        please enter 'p' to play or enter 'q' to quit"
    user_input = gets.chomp
    until user_input == 'p' || user_input == 'q'
        "please enter one of the following: p or q"
        user_input = gets.chomp
    end
    if user_input == "p" 
      play_game
    elsif user_input == "q"
      Process.exit!
    end
  end
end
