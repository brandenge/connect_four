class Board
  attr_reader :grid
  def initialize
    @grid = initialize_board
  end

  def initialize_board
    board = []
    6.times { board << ('.' * 7).chars }
    board
  end

  def render_board
    puts [*('A'..'G')].join(" ")
    @grid.each { |row| puts row.join(' ') }
    @grid
  end
end

board = Board.new
board.render_board
