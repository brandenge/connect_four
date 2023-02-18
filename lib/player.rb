class Player

  @@count = 0

  def initialize
    @name = get_name
    @symbol = get_symbol
  end

  def get_name
    @@count += 1
    puts "Player #{@@count}, enter your name"
    name = gets.chomp
  end

  def get_symbol
    symbol = @@count==1 ? "X" : "O"
    puts "Your symbol is #{symbol}"
    symbol
  end

end