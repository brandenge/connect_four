require './lib/messages'

class Board
  include Messages

  attr_reader :grid

  def initialize
    @grid = initialize_board
    @turns = []
    @columns = [*('A'..'G')]
  end

  def initialize_board
    @grid = [*(1..6)].map do |row|
      [*(1..7)].map { |col| :white }
    end
  end

  def render
    blocks = {
      line: "[0;37;5;40;100m#{' ' * 72}[0m",
      border: "[0;37;5;40;100m#{' ' * 2}[0m",
      blue: "[0;36;5;44;104m#{' ' * 8}[0m",
      white: "[0;37;5;47;107m#{' ' * 8}[0m",
      red: "[0;31;5;41;101m#{' ' * 8}[0m"
    }
    padding = '      '
    puts "\n\n"
    render_col_text
    @grid.each do |row|
      puts padding + blocks[:line]
      row = row.map do |slot|
        case slot
          when :white then blocks[:white]
          when :blue then blocks[:blue]
          when :red then blocks[:red]
        end
      end
      row = padding + blocks[:border] + row.join(blocks[:border]) + blocks[:border]
      puts "#{row}\n#{row}\n#{row}\n#{row}\n"
    end
    puts padding + blocks[:line]
    puts "\n\n"
    @grid
  end

  def render_col_text
    puts COLUMN_TEXT
  end

  def next_turn(player)
    if player.is_human?
      move = player.player_move(valid_columns)
      row = find_lowest_row(move)
      col = @columns.index(move)
    else
      row, col = computer_move(valid_columns)
    end
    @turns << Turn.new(player, row, col)
    nil
  end

  def computer_move(valid_columns)
    move = check_for_win(:red)
    return move if move
    move = check_for_win(:blue)
    return move if move
    find_lowest_slots(valid_columns).sample
  end

  def check_for_win(color)
    lowest_slots = find_lowest_slots(valid_columns)
    move = nil
    lowest_slots.each do |(row, col)|
      if winner({row: row, col: col, color: color})
        move = [row, col]
        break
      end
    end
    move
  end

  def update
    initialize_board
    @turns.each { |turn| @grid[turn.row][turn.col] = turn.player.color }
    nil
  end

  def find_lowest_row(column)
    slot_index = @columns.index(column)
    row_index = @grid.length - 1
    @grid.each_with_index do |row, index|
      if row[slot_index] == :white
        row_index = index
      else
        break
      end
    end
    row_index
  end

  def find_lowest_slots(valid_columns)
    valid_columns.map do |column|
      [find_lowest_row(column), @columns.index(column)]
    end
  end

  def valid_columns
    columns = [@columns, @grid[0]]
    checks = columns.transpose
    available_columns = checks.filter { |(column, color)| color == :white }
    available_columns.map { |(column)| column }
  end

  def winner(row: @turns.last&.row,
             col: @turns.last&.col,
             color: @turns.last&.player&.color,
             direction: nil,
             count: 1)

    return nil if @turns.empty?
    if count == 4
      return color
    elsif row < 0 || col < 0 || @grid[row]&.[](col) == nil
      return nil
    end

    result = nil
    adj_directions = [:top_right, :right, :bottom_right, :bottom, :bottom_left, :left, :top_left]

    direction == nil && adj_directions.each do |adj_direction|
      adj_slot = adjacent_slot(row, col, adj_direction)
      result = first_adjacent_match(row, col, color, adj_direction, count)
      break if result
    end
    return result if result
    another_adjacent_match(row, col, color, direction, count)
  end

  def adjacent_slot(row, col, direction)
    slots = {
      top_right: {
        row: row - 1,
        col: col + 1,
        color: @grid[row - 1]&.[](col + 1),
        opposite: :bottom_left
      },
      right: {
        row: row,
        col: col + 1,
        color: @grid[row]&.[](col + 1),
        opposite: :left
      },
      bottom_right: {
        row: row + 1,
        col: col + 1,
        color: @grid[row + 1]&.[](col + 1),
        opposite: :top_left
      },
      bottom: {
        row: row + 1,
        col: col,
        color: @grid[row + 1]&.[](col),
        opposite: nil
      },
      bottom_left: {
        row: row + 1,
        col: col - 1,
        color: @grid[row + 1]&.[](col - 1),
        opposite: :top_right
      },
      left: {
        row: row,
        col: col - 1,
        color: @grid[row]&.[](col - 1),
        opposite: :right
      },
      top_left: {
        row: row - 1,
        col: col - 1,
        color: @grid[row - 1]&.[](col - 1),
        opposite: :bottom_right
      }
    }
    slots[direction]
  end

  def first_adjacent_match(row, col, color, adj_direction, count)
    adj_slot = adjacent_slot(row, col, adj_direction)
    arguments = {
      row: adj_slot[:row],
      col: adj_slot[:col],
      color: color,
      direction: adj_direction,
      count: count + 2
    }
    if adj_slot[:color] == color &&
      adjacent_slot(row, col, adj_slot[:opposite])&.[](:color) == color
      return winner(arguments)
      arguments[:direction] = adj_slot[:opposite]
      return opposite_adjacent_match(row, col, color, adj_direction, count)
    elsif adj_slot[:color] == color
      arguments[:count] = count + 1
      return winner(arguments)
    end
  end

  def opposite_adjacent_match(row, col, color, adj_direction, count)
    adj_slot = adjacent_slot(row, col, adj_direction)
    arguments = {
      row: adjacent_slot(row, col, adj_slot[:opposite])[:row],
      col: adjacent_slot(row, col, adj_slot[:opposite])[:col],
      color: color,
      direction: adj_slot[:opposite],
      count: count
    }
    return winner(arguments)
  end

  def another_adjacent_match(row, col, color, direction, count)
    adj_slot = adjacent_slot(row, col, direction)
    if direction != nil && adj_slot[:color] == color
      arguments = {
        row: adj_slot[:row],
        col: adj_slot[:col],
        color: color,
        direction: direction,
        count: count + 1
      }
      return winner(arguments)
    end
  end
end
