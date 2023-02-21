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
    puts "#{@name}, please select letter to use as a drop point from the following columns: #{valid_columns.join(", ")}."
    player_selection = gets.chomp.upcase
    until valid_columns.include?(player_selection)
      puts "Sorry, that is not a valid selection, please choose from one of the following: #{valid_columns.join(", ")}."
      player_selection = gets.chomp.upcase
    end
    player_selection
  end

  def random_move(valid_columns)
    valid_columns.sample
  end
end
