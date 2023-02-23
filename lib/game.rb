require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/title'
require './lib/messages'

class Game
  include Title
  include Messages

  def initialize
    @players = [
      Player.new('Player 1', :blue),
      Player.new('Player 2', :red, false)
    ]
    @board = Board.new
  end

  def start
    welcome
    game_menu
  end

  def play_game
    @board.render
    until game_over?
      @players.each do |player|
        break if game_over?
        if !player.is_human?
          sleep(0.5)
          puts "The Computer is strategizing...\n\n"
          sleep(1.5)
          puts BEEP_BOOP_BOP
          sleep(1)
        end
        @board.next_turn(player.name, player.color, player.is_human?)
        @board.update
        @board.render
      end
    end
    game_over
  end

  def game_over?
   @board.winner || @board.valid_columns.empty?
  end

  def welcome
    puts TITLE
    sleep(2)
    puts WELCOME_MESSAGE
  end

  def game_menu
    puts GAME_PLAY_PROMPT
    user_input = gets.chomp
    until user_input == 'p' || user_input == 'q'
      puts "Please enter one of the following: p or q"
      user_input = gets.chomp
    end
    if user_input == "p"
      puts "    ...\n\n"
      sleep(1)
      puts "    Ok. You will be the Blue block. Good luck!"
      sleep(3)
      play_game
    elsif user_input == "q"
      Process.exit!
    end
  end

  def game_over
    puts "    ...\n\n"
    sleep(1)
    puts "    ...\n\n"
    sleep(1)
    puts "    ...\n\n"
    sleep(1)
    if @board.valid_columns.empty?
      puts DRAW_MESSAGE
    elsif @players.find { |player| player.color == @board.winner }.is_human?
      puts HUMAN_WIN_MESSAGE
    else
      puts COMPUTER_WIN_MESSAGE
    end
  end
end
