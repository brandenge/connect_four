class Player
  attr_reader :name,
              :color

  def initialize (name, color, is_human = true)
    @name = name
    @color = color
    @is_human = is_human
  end

  def is_human?
    @is_human
  end

  def set_name(name)
    @name = name
  end

  def player_move(valid_columns)
    puts "#{@name}, please select a letter from the following columns: #{valid_columns.join(", ")}."
    player_selection = gets.chomp.upcase
    until valid_columns.include?(player_selection)
      puts "Sorry, that is not a valid selection. Please choose from one of the following: #{valid_columns.join(", ")}."
      player_selection = gets.chomp.upcase
    end
    player_selection
  end
end
