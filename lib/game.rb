require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/title'
require './lib/messages'

class Game
  include Title
  include Messages

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
          puts BEEP_BOOP_BOP
          sleep(1)
        end
        @board.render
      end
    end
    render_game_over
  end

  def game_over?
   @board.winner || @board.valid_columns.empty?
  end

  def render_welcome
    puts TITLE
    puts WELCOME_MESSAGE
  end

  def render_menu
    puts GAME_PLAY_PROMPT
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

  def render_game_over
    puts "..."
    sleep(1)
    if @board.valid_columns.empty?
      puts DRAW_MESSAGE
    elsif @board.winner.is_human?
      puts HUMAN_WIN_MESSAGE
    else
      puts COMPUTER_WIN_MESSAGE
    end
  end
end