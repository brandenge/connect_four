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
    nil
  end
end
