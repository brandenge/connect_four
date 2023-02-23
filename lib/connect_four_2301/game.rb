require './lib/connect_four_2301/player'
require './lib/connect_four_2301/board'
require './lib/connect_four_2301/turn'
require './lib/connect_four_2301/title'
require './lib/connect_four_2301/messages'

class Game
  include Title
  include Messages

  def initialize
    @players = [
      Player.new('Player 1', :blue),
      Player.new('Player 2', :red, false)
    ]
    @board = Board.new
    @starting_time = 0
    @ending_time = 0
    @recorded_times = []
  end

  def start
    welcome
    game_menu
  end

  def play_game
    @board.initialize_board
    @board.render
    starting_time
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
        puts `clear`
        @board.render
      end
    end
    ending_time
    game_over
  end

  def play_2_player_game
   
  end

  def starting_time
    @starting_time += Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  def ending_time
    @ending_time += Process.clock_gettime(Process::CLOCK_MONOTONIC)
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
    puts "             Please enter '1' for a 1 person game against the computer, or press '2' for a two person game, or pres 'Q' to exit out of the program."
    user_input = gets.chomp
    until user_input == '1' || user_input == '2' || user_input == 'q'
      puts "           Please enter one of the following: 1, 2, or q"
      user_input = gets.chomp
    end
    if user_input == '1'
      puts "    ...\n\n\n\n"
      sleep(1)
      puts "             Ok. You will be the Blue block. Good luck!"
      sleep(3)
      play_game
    elsif user_input == '2'
      puts " Player 1, please enter your name:"
      player_1_name = gets.chomp.capitalize
      puts " Player 2, please enter your name:"
      player_2_name = gets.chomp.capitalize
      player_1 = Player.new(player_1_name, :blue )
      player_2 = Player.new(player_2_name, :red )
      @players = [player_1, player_2]
      play_game
    else user_input == 'q'
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
      sleep(1)
      puts "\n\n\n\n\n"
      puts elapsed_time
      puts "\n\n\n\n\n"
      play_again?
    elsif @players.find { |player| player.color == @board.winner }.is_human?
      puts HUMAN_WIN_MESSAGE
      sleep(1)
      puts "\n\n\n\n\n\n\n"
      puts elapsed_time
      puts "\n\n\n\n\n\n\n"
      play_again?
    else
      puts COMPUTER_WIN_MESSAGE
      sleep(1)
      puts "\n\n\n\n\n\n\n"
      puts elapsed_time
      puts "\n\n\n\n\n\n\n"
      play_again?
    end
  end

  def play_again?
    puts "Thanks for playing!"
    puts "\n\n\n\n"
    puts "If you would like to play again, enter 'Y'. If you would like to exit the game, enter 'Q'. "
    user_input = gets.chomp.capitalize
    if user_input == 'Y'
      play_game
    elsif user_input == 'Q'
      Process.exit!
    end
  end

  def elapsed_time
    elapsed_time = @ending_time - @starting_time
    if elapsed_time >= 60.00
      time_in_minutes = elapsed_time.fdiv(60)
      @recorded_times << time_in_minutes
      puts "Wow, you finished the game in #{time_in_minutes.round(2)} minutes!"
      puts "\n\n"
      fastest_elapsed__time
      puts "\n\n"
      average_elapsed_time
    elsif elapsed_time < 60.00
      time_in_seconds = elapsed_time.round(2)
      @recorded_times << time_in_seconds
      puts "Wow that was fast! You finished the game in #{time_in_seconds} seconds!"
      puts "\n\n"
      fastest_elapsed__time
      puts "\n\n"
      average_elapsed_time
    end
  end

  def average_elapsed_time
    sum_of_times = @recorded_times.sum
    num_of_times = @recorded_times.length
    long_average_time = sum_of_times.fdiv(num_of_times) 
    average_time = long_average_time.round(2)
    if average_time >= 60.00
      puts "On average it took you #{average_time} minutes to finish a game."
    end
    if average_time < 60.00
      puts "On average it took you #{average_time} seconds to finish a game."
    end
  end

  def fastest_elapsed__time
    fastest_time = @recorded_times.sort.first.round(2)
    if fastest_time >= 60.00
      puts "So far, your fastest time to finish the game is #{fastest_time} minutes."
    end
    if fastest_time < 60.00
      puts "So far, your fastest time to finish the game is #{fastest_time} seconds."
    end
  end
end
