class Board
  COLORS = {
    blue: '[0;36;5;44;104mX[0m',
    white: '[0;37;5;47;107m.[0m',
    red: '[0;31;5;41;101mO[0m'
  }.freeze

  @@columns = [*('A'..'G')]

  attr_reader :grid
  
  def initialize
    @grid = initialize_board
    @turns = []
  end

  def initialize_board
    @grid = [*(1..6)].map do |row|
      [*(1..7)].map { |col| (COLORS[:white]) }
    end
  end

  def render_board
    padding = '      '
    puts "\n\n" + padding + @@columns.join
    @grid.each { |row| puts padding + row.join }
    puts "\n\n" 
    @grid
  end

  def next_turn(player)
    if player.is_human?
      @turns << Turn.new(player, player.player_move(valid_columns))
    else
      @turns << Turn.new(player, player.random_move(valid_columns))
    end
  end

  def update_board
    initialize_board
    @turns.each do |turn|
      player_move = turn.column
      @grid[find_lowest_row(player_move)][@@columns.index(player_move)] = turn.player.token 
    end
  end

  def find_lowest_row(player_move) 
    slot_index = @@columns.index(player_move)
    row_index = @grid.length - 1  
    @grid.each_with_index do |row, index|
      if row[slot_index] == COLORS[:white]
        row_index = index
      else
        break
      end
    end
    row_index
  end

  def valid_columns
    columns = [@@columns, @grid[0]]
    checks = columns.transpose
    available_columns = checks.filter { |(column, color)| color == COLORS[:white] }
    available_columns.map { |(column)| column }
  end

  def winner(row, col, direction = nil, count = 0)
    player_color = COLORS[@turns.last.player.token]
    if count == 4
      return @turns.last.player
    elsif @grid[row][col] == nil
      return nil
    end

    if direction == nil
      case player_color
        when @grid[row - 1][col] then winner(row -1, col, :top, count + 1)
        when @grid[row - 1][col + 1] then winner(row -1, col + 1, :top_right, count + 1)
        when @grid[row][col + 1] then winner(row, col + 1, :right, count + 1)
        when @grid[row + 1][col + 1] then winner(row + 1, col + 1, :bottom_right, count + 1)
        when @grid[row + 1][col] then winner(row + 1, col, :bottom, count + 1)
        when @grid[row + 1][col - 1] then winner(row + 1, col - 1, :bottom_left, count + 1)
        when @grid[row][col - 1] then winner(row, col - 1, :left, count + 1)
        when @grid[row - 1][col - 1] then winner(row - 1, col - 1, :top_left, count + 1)
      end
    else
      case
        when direction == :top && @grid[row - 1][col]  == player_color
          winner(row -1, col, :top, count + 1)
        when direction == :top_right &&  @grid[row - 1][col + 1] == player_color 
          winner(row -1, col + 1, :top_right, count + 1)
        when direction == :right && @grid[row][col + 1] == player_color
          winner(row, col + 1, :right, count + 1)
        when direction == :bottom_right && @grid[row + 1][col + 1] == player_color 
          winner(row + 1, col + 1, :bottom_right, count + 1)
        when direction == :bottom &&  @grid[row + 1][col] == player_color 
          winner(row + 1, col, :bottom, count + 1)
        when direction == :bottom_left && @grid[row + 1][col - 1] == player_color 
          winner(row + 1, col - 1, :bottom_left, count + 1)
        when direction == :left && @grid[row][col - 1] == player_color 
          winner(row, col - 1, :left, count + 1)
        when direction == :top_left &&  @grid[row - 1][col - 1] == player_color 
          winner(row - 1, col - 1, :top_left, count + 1)
      end
    end
  end
end


# board = Board.new
# board.initialize_board
# board.valid_columns