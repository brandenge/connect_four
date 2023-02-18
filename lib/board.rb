class Board
  COLORS = {
    green: '[0;1;30;90;46m [0m',
    white: '[0;37;5;47;107m [0m',
    red: '[0;31;5;41;101m [0m'
  }.freeze

  attr_reader :grid
  def initialize
    @grid = []
  end

  def initialize_board
    @grid = [*(1..6)].map do |row|
      [*(1..7)].map do |col|
        (COLORS[:white])
      end
    end
  end

  def render_board
    puts [*('A'..'G')].join
    @grid.each { |row| puts row.join }
    @grid
  end
end
