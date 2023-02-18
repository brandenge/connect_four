class Player
  attr_reader :name

  def initialize (name, is_human = true)
    @name = name
    @is_human = is_human
  end

  def is_human?
    @is_human
  end

  def set_name(name)
    @name = name
  end

  def player_move(valid_columns)

  end

  def random_move(valid_columns)

  end
end
