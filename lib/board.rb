class Board
  def initialize
    @grid = initialize_board
  end

  def initialize_board
    board = []
    6.times { board << ('.' * 7).chars }
    board
  end

  def render_board
    @grid.each { |row| puts row.join(' ') }
  end
end

board = Board.new
board.render_board
