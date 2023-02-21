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
      player_move = player.player_move(valid_columns)
    else
      player_move = player.random_move(valid_columns)
    end
    col = @columns.index(player_move)
    row = find_lowest_row(player_move)
    @turns << Turn.new(player, row, col)
    nil
  end

  def update
    initialize_board
    @turns.each do |turn|
      @grid[turn.row][turn.col] =
        turn.player.color
    end
    nil
  end

  def find_lowest_row(player_move)
    slot_index = @columns.index(player_move)
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

  def valid_columns
    columns = [@columns, @grid[0]]
    checks = columns.transpose
    available_columns = checks.filter { |(column, color)| color == :white }
    available_columns.map { |(column, _)| column }
  end

  def winner(row: @turns.last&.row,
             col: @turns.last&.col,
             direction: nil,
             count: 1)

    return nil if @turns.empty?
    player_color = @turns.last.player.color
    if count == 4
      return @turns.last.player
    elsif row < 0 || col < 0 || @grid[row]&.[](col) == nil
      return nil
    end

    adjacent_slots = {
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

    result_1 = nil
    result_2 = nil
    result_3 = nil

    adjacent_slots.each do |adj_direction, adj_slot|
      if direction == nil && adj_slot[:color] == player_color
        arguments = {
          row: adj_slot[:row],
          col: adj_slot[:col],
          direction: adj_direction,
          count: count + 1
        }
        result_1 = winner(arguments)

        if adjacent_slots[adj_slot[:opposite]]&.[](:color) == player_color
          arguments[:count] = count + 2
          result_2 = winner(arguments)
          arguments = {
            row: adjacent_slots[adj_slot[:opposite]][:row],
            col: adjacent_slots[adj_slot[:opposite]][:col],
            direction: adj_slot[:opposite],
            count: count + 2
          }
          result_3 = winner(arguments)
        end
      end
    end

    return result_1 if result_1
    return result_2 if result_2
    return result_3 if result_3

    if direction != nil && adjacent_slots[direction][:color] == player_color
      arguments = {
        row: adjacent_slots[direction][:row],
        col: adjacent_slots[direction][:col],
        direction: direction,
        count: count + 1
      }
      return winner(arguments)
    end
  end
end
