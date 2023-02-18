class Board
  COLORS = {
    blue: '[0;1;30;90;46m [0m',
    white: '[0;37;5;47;107m [0m',
    red: '[0;31;5;41;101m [0m'
  }.freeze

  attr_reader :grid
  
  def initialize
    @grid = []
    @turns = []
  end

  def initialize_board
    @grid = [*(1..6)].map do |row|
      [*(1..7)].map do |col|
        (COLORS[:white])
      end
    end
  end

  def render_board
    padding = '      '
    puts "\n\n" + padding + [*('A'..'G')].join
    @grid.each { |row| puts padding + row.join }
    @grid
  end

  def next_turn(player)
    if player.is_human?
      @turns << Turn.new(player, player.player_move(valid_columns))
    else
      @turns << Turn.new(player, player.random_move(valid_columns))
    end
  end

  def update

  end

  def valid_columns
    []
  end

  def winner
    nil
  end
end
