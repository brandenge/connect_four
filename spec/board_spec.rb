require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new

    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)

    @turn_1 = Turn.new(5, 0, :blue)
    @turn_2 = Turn.new(5, 1, :red)
    @turn_3 = Turn.new(4, 0, :blue)
    @turn_4 = Turn.new(4, 1, :red)
    @turn_5 = Turn.new(3, 0, :blue)
    @turn_6 = Turn.new(3, 1, :red)
    @turn_7 = Turn.new(2, 0, :blue)
    @turn_8 = Turn.new(2, 1, :red)
    @turn_9 = Turn.new(1, 0, :blue)
    @turn_10 = Turn.new(1, 1, :red)
    @turn_11 = Turn.new(0, 0, :blue)

    @board.set_turns([@turn_1]) # bypass the guard clause in #winner

    @fake_slots = [*(1..6)].map do |row|
      [*(1..7)].map { |col| :white }
    end

    def set_mock_slot(row, col, color)
      @fake_slots[row][col] = color
    end
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_a(Board)
    end
  end

  describe '@columns' do
    it 'is an array of all of the columns of the board/grid' do
      expect(@board.columns).to eq([*('A'..'G')])
    end

    example 'each element in the array is a string' do
      actual = @board.columns.all? do |column|
        column.is_a?(String)
      end
      expect(actual).to eq(true)
    end
  end

  describe '#slots' do
    it 'has a 2-dimensional array of slot colors' do
      expect(@board.slots).to eq(@fake_slots)
    end

    example 'each slot is a symbol' do
      actual = @board.slots.all? do |row|
        row.all? do |slot|
          slot.is_a?(Symbol)
        end
      end
      expect(actual).to eq(true)
    end
  end

  describe '#turns' do
    it 'starts empty' do
      board = Board.new
      expect(board.turns.empty?).to eq(true)
    end

    it 'returns an array of Turn objects' do
      @board.set_turns([@turn_1, @turn_2])
      actual = @board.turns.all? { |turn| turn.is_a?(Turn) }
      expect(actual).to eq(true)
    end
  end

  describe '#initialize_board' do
    it 'returns the initial grid' do
      expect(@board.initialize_board).to eq(@fake_slots)
    end
  end

  describe '#render' do
    it 'returns nil' do
      expect(@board.render).to eq(nil)
    end
  end

  describe '#render_col_text' do
    it 'returns nil' do
      expect(@board.render).to eq(nil)
    end
  end

  describe '#next_turn' do
    it 'adds 1 turn to the array of turns each time it is called' do
      board = Board.new
      board.next_turn(*PLAYER_2.values)
      expect(board.turns.count).to eq(1)
      board.next_turn(*PLAYER_2.values)
      expect(board.turns.count).to eq(2)
      board.next_turn(*PLAYER_2.values)
      expect(board.turns.count).to eq(3)
    end

    it 'returns nil' do
      expect(@board.next_turn(*PLAYER_2.values)).to eq(nil)
    end
  end

  describe '#computer_move' do
    before(:each) do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :red, :white, :white, :white],
        [:white, :white, :white, :blue, :white, :white, :white],
        [:white, :red, :blue, :blue, :white, :white, :white],
        [:red, :blue, :blue, :red, :white, :white, :white]
      ]
      @board.set_slots(slots)
    end

    it 'returns an array' do
      expect(@board.computer_move(@board.valid_columns)).to be_a(Array)
    end

    it 'returns an array of 2 integer indexes that represent the slot of a move' do
      actual = @board.computer_move(@board.valid_columns).all? do |index|
        index.is_a?(Integer)
      end
      expect(@board.computer_move(@board.valid_columns).count).to eq(2)
      expect(actual).to eq(true)
    end

    it 'returns a winning move if there is one' do
      expect(@board.computer_move(@board.valid_columns)).to eq([3, 2])
    end

    it 'returns a blocking move to prevent the opponent from winning if there is one' do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :blue, :blue, :white, :white, :white],
        [:white, :blue, :blue, :blue, :white, :white, :white],
        [:red, :blue, :blue, :blue, :red, :white, :white]
      ]
      @board.set_slots(slots)
      expect(@board.computer_move(@board.valid_columns)).to eq([4, 0])
    end

    it 'returns the winning move before the blocking move' do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :red, :white, :white, :white],
        [:white, :white, :white, :blue, :white, :white, :white],
        [:white, :red, :blue, :blue, :white, :white, :white],
        [:red, :blue, :blue, :blue, :white, :white, :white]
      ]
      @board.set_slots(slots)
      expect(@board.computer_move(@board.valid_columns)).to eq([3, 2])
    end

    it 'picks a random column to make a move if there is neither any winning move or blocking move' do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :red, :white, :white, :white],
        [:white, :white, :blue, :blue, :red, :white, :white],
        [:white, :red, :blue, :blue, :blue, :white, :white],
        [:red, :blue, :blue, :red, :red, :white, :white]
      ]
      @board.set_slots(slots)
      actual = @board.find_lowest_slots(@board.valid_columns)
        .include?(@board.computer_move(@board.valid_columns))
      expect(actual).to eq(true)
    end
  end

  describe '#check_for_win' do
    before(:each) do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :red, :white, :white, :white],
        [:white, :white, :white, :blue, :white, :white, :white],
        [:white, :red, :blue, :blue, :white, :white, :white],
        [:red, :blue, :blue, :red, :white, :white, :white]
      ]
      @board.set_slots(slots)
    end
    it 'returns an array if there is a winning move' do
      expect(@board.check_for_win(:red)).to be_a(Array)
    end

    it 'returns a move if there is any move that would immediately win the game' do
      expect(@board.check_for_win(:red)).to eq([3, 2])
    end

    it 'returns an array of 2 integer indexes that represent the slot of a move if there is a winning move' do
      actual = @board.check_for_win(:red).all? do |index|
        index.is_a?(Integer)
      end
      expect(actual).to eq(true)
      expect(@board.check_for_win(:red).count).to eq(2)
    end

    it 'returns nil if there is no immediate winning move' do
      slots = [
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :white, :white, :white, :white],
        [:white, :white, :white, :red, :white, :white, :white],
        [:white, :white, :blue, :blue, :red, :white, :white],
        [:white, :red, :blue, :blue, :blue, :white, :white],
        [:red, :blue, :blue, :red, :red, :white, :white]
      ]
      @board.set_slots(slots)
      expect(@board.check_for_win(:red)).to eq(nil)
    end
  end

  describe '#update' do
    it 'does nothing at the start' do
      board = Board.new
      board.update
      expect(board.slots).to eq(@fake_slots)
    end

    it 'returns nil' do
      expect(@board.update).to eq(nil)
    end

    it 'it updates the board after 1 turn' do
      set_mock_slot(5, 0, :blue)
      @board.set_turns([@turn_1])
      @board.update
      expect(@board.slots).to eq(@fake_slots)
    end

    it 'it updates the board after 2 turns' do
      set_mock_slot(5, 0, :blue)
      set_mock_slot(5, 1, :red)
      @board.set_turns([@turn_1, @turn_2])
      @board.update
      expect(@board.slots).to eq(@fake_slots)
    end

    it 'it updates the board after 3 turns' do
      set_mock_slot(5, 0, :blue)
      set_mock_slot(5, 1, :red)
      set_mock_slot(4, 0, :blue)
      @board.set_turns([@turn_1, @turn_2, @turn_3])
      @board.update
      expect(@board.slots).to eq(@fake_slots)
    end

    it 'updates the board after many turns' do
      set_mock_slot(5, 0, :blue)
      set_mock_slot(5, 1, :red)
      set_mock_slot(4, 0, :blue)
      set_mock_slot(4, 1, :red)
      set_mock_slot(3, 0, :blue)
      set_mock_slot(3, 1, :red)
      set_mock_slot(2, 0, :blue)
      @board.set_turns([@turn_1, @turn_2, @turn_3, @turn_4, @turn_5, @turn_6, @turn_7])
      @board.update
      expect(@board.slots).to eq(@fake_slots)
    end
  end

  describe '#find_lowest_row' do
    it 'returns an integer index' do
      expect(@board.find_lowest_row('A')).to be_a(Integer)
    end

    it 'defaults to the last row index' do
      expect(@board.find_lowest_row('A')).to eq(5)
    end

    it 'returns the second-to-last row index when there is a token in the same column' do
      @board.set_turns([@turn_1])
      @board.update
      expect(@board.find_lowest_row('A')).to eq(4)
    end

    it 'returns the fourth row index when there are 2 tokens in the same column' do
      @board.set_turns([@turn_1, @turn_3])
      @board.update
      expect(@board.find_lowest_row('A')).to eq(3)
    end

    it 'returns the third row index when there are 3 tokens in the same column' do
      @board.set_turns([@turn_1, @turn_3, @turn_5])
      @board.update
      expect(@board.find_lowest_row('A')).to eq(2)
    end

    it 'returns the second row index when there are 4 tokens in the same column' do
      @board.set_turns([@turn_1, @turn_3, @turn_5, @turn_7])
      @board.update
      expect(@board.find_lowest_row('A')).to eq(1)
    end

    it 'returns the first row index when there are 5 tokens in the same column' do
      @board.set_turns([@turn_1, @turn_3, @turn_5, @turn_7, @turn_9])
      @board.update
      expect(@board.find_lowest_row('A')).to eq(0)
    end
  end

  describe '#find_lowest_slots' do
    before(:each) do
      slots = [
        [:red, :white, :white, :white, :white, :white, :white],
        [:blue, :red, :white, :white, :white, :white, :white],
        [:red, :blue, :blue, :white, :white, :white, :white],
        [:blue, :blue, :blue, :blue, :white, :white, :white],
        [:red, :blue, :blue, :blue, :red, :white, :white],
        [:blue, :red, :blue, :red, :blue, :blue, :white]
      ]
      @board.set_slots(slots)
    end

    it 'returns an array' do
      expected = [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]]
      expect(@board.find_lowest_slots([*('B'..'G')])).to be_a(Array)
    end

    it 'returns an array of arrays' do
      actual = @board.find_lowest_slots([*('B'..'G')]).all? do |slot|
        slot.is_a?(Array)
      end
      expect(actual).to eq(true)
    end

    it 'returns the array of lowest slot coordinates' do
      expected = [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6]]
      expect(@board.find_lowest_slots(@board.valid_columns)).to eq(expected)
    end

    it 'returns a different array of lowest slot coordinates' do
      slots = [
        [:white, :white, :white, :white, :white, :white, :blue],
        [:white, :white, :white, :white, :white, :blue, :blue],
        [:white, :white, :white, :white, :blue, :blue, :blue],
        [:white, :white, :white, :blue, :blue, :blue, :blue],
        [:white, :white, :blue, :blue, :blue, :blue, :blue],
        [:white, :blue, :blue, :blue, :blue, :blue, :blue]
      ]
      @board.set_slots(slots)
      expected = [[5, 0], [4, 1], [3, 2], [2, 3], [1, 4], [0, 5]]
      expect(@board.find_lowest_slots(@board.valid_columns)).to eq(expected)
    end
  end

  describe '#valid_columns' do
    it 'starts with all columns being valid' do
      expect(@board.valid_columns).to eq(@board.columns)
    end

    it 'it removes full columns from the array of valid columns' do
      @board.set_turns([@turn_1, @turn_3, @turn_5, @turn_7, @turn_9, @turn_11])
      @board.update
      expect(@board.valid_columns).to eq([*('B'..'G')])
    end

    it 'returns an empty array when there are no columns valid' do
      @fake_slots = [*(1..6)].map do |row|
        [*(1..7)].map { |col| :blue }
      end
      @board.set_slots(@fake_slots)
      expect(@board.valid_columns).to eq([])
    end
  end

  describe '#winner' do
    before(:each) do
      @arguments = {
        row: 5,
        col: 0,
        color: :blue
      }
    end

    it 'returns a winning player when they have won' do
      @board.insert_slots(:blue, ['A', 'B', 'C', 'D'])
      expect(@board.winner(@arguments)).to eq(:blue)
    end

    it 'returns a different winning player when they have won' do
      @board.insert_slots(:red, ['A', 'B', 'C', 'D'])
      expect(@board.winner(row: 5, col: 0, color: :red)).to eq(:red)
    end

    context 'it returns nil when there is no winner' do
      example 'there are no moves on the board' do
        expect(@board.winner(@arguments)).to eq(nil)
      end

      example '3 in a row vertically' do
        @board.insert_slots(:blue, ['A', 'A', 'A'])
        expect(@board.winner(@arguments)).to eq(nil)
      end

      example '3 in a row horizontally' do
        @board.insert_slots(:blue, ['A', 'B', 'C'])
        expect(@board.winner(@arguments)).to eq(nil)
      end

      example '3 in a row diagonally bottom left to top right' do
        @board.insert_slots(:blue, ['A', 'B', 'B', 'C', 'C', 'C'])
        expect(@board.winner(@arguments)).to eq(nil)
      end

      example '3 in a row diagonally top left to bottom right' do
        @board.insert_slots(:blue, ['A', 'A', 'A', 'B', 'B', 'C'])
        expect(@board.winner(@arguments)).to eq(nil)
      end
    end

    context 'it returns the winning color for 4 in a row vertically' do
      before(:each) do
        @board.insert_slots(:blue, ['A', 'A', 'A', 'A'])
      end

      example 'starting from the top' do
        expect(@board.winner(row: 2, col: 0, color: :blue)).to eq(:blue)
      end
    end

    context 'it returns the winning color for 4 in a row horizontally' do
      before(:each) do
        @board.insert_slots(:blue, ['A', 'B', 'C', 'D'])
      end

      example 'starting from the left' do
        expect(@board.winner(row: 5, col: 0, color: :blue)).to eq(:blue)
      end

      example 'starting from the right' do
        expect(@board.winner(row: 5, col: 3, color: :blue)).to eq(:blue)
      end

      example 'starting from the middle' do
        expect(@board.winner(row: 5, col: 1, color: :blue)).to eq(:blue)
      end

      example 'starting from the other middle' do
        expect(@board.winner(row: 5, col: 2, color: :blue)).to eq(:blue)
      end
    end

    context 'it returns the winning color for 4 in a row diagonally bottom left to top right' do
      before(:each) do
        @board.insert_slots(:red, ['B', 'C', 'C', 'D', 'D', 'D'])
        @board.insert_slots(:blue, ['A', 'B', 'C', 'D'])
      end

      example 'starting from the bottom left' do
        expect(@board.winner(row: 5, col: 0, color: :blue)).to eq(:blue)
      end

      example 'starting from the top right' do
        expect(@board.winner(row: 2, col: 3, color: :blue)).to eq(:blue)
      end

      example 'starting from the middle' do
        expect(@board.winner(row: 4, col: 1, color: :blue)).to eq(:blue)
      end

      example 'starting from the other middle' do
        expect(@board.winner(row: 3, col: 2, color: :blue)).to eq(:blue)
      end
    end

    context 'it returns the winning color for 4 in a row diagonally top left to bottom right' do
      before(:each) do
        @board.insert_slots(:red, ['A', 'A', 'A', 'B', 'B', 'C'])
        @board.insert_slots(:blue, ['A', 'B', 'C', 'D'])
      end

      example 'starting from the top left' do
        expect(@board.winner(row: 2, col: 0, color: :blue)).to eq(:blue)
      end

      example 'starting from the bottom right' do
        expect(@board.winner(row: 5, col: 3, color: :blue)).to eq(:blue)
      end

      example 'starting from the middle' do
        expect(@board.winner(row: 3, col: 1, color: :blue)).to eq(:blue)
      end

      example 'starting from the other middle' do
        expect(@board.winner(row: 4, col: 2, color: :blue)).to eq(:blue)
      end
    end
  end

  describe '#first_adjacent_match' do
    before(:each) do
      @board.set_turns([@turn_1]) # bypass the guard clause in #winner
    end

    context 'it returns the color when it has 4 in a row in any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :blue, :blue, :blue, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(:blue)
      end

      example 'the right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :right, 1)).to eq(:blue)
      end

      example 'the bottom right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_right, 1))
          .to eq(:blue)
      end

      example 'the bottom direction' do
        expect(@board.first_adjacent_match(2, 2, :blue, :bottom, 1))
          .to eq(:blue)
      end

      example 'the bottom left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_left, 1))
          .to eq(:blue)
      end

      example 'the left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :left, 1)).to eq(:blue)
      end

      example 'the top left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(:blue)
      end
    end

    context 'it returns nil when the color does not have 4 in a row from any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(nil)
      end

      example 'the right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :right, 1)).to eq(nil)
      end

      example 'the bottom right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_right, 1))
          .to eq(nil)
      end

      example 'the bottom direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom, 1))
          .to eq(nil)
      end

      example 'the bottom left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_left, 1))
          .to eq(nil)
      end

      example 'the left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :left, 1)).to eq(nil)
      end

      example 'the top left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(nil)
      end
    end
  end

  describe '#opposite_adjacent_match' do
    before(:each) do
      @board.set_turns([@turn_1]) # bypass the guard clause in #winner
    end

    context 'it returns the color when it has 4 in a row in any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :blue, :blue, :blue, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :top_right, 3))
          .to eq(:blue)
      end

      example 'the right direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :right, 3)).to eq(:blue)
      end

      example 'the bottom right direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :bottom_right, 3))
          .to eq(:blue)
      end

      example 'the bottom left direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :bottom_left, 3))
          .to eq(:blue)
      end

      example 'the left direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :left, 3)).to eq(:blue)
      end

      example 'the top left direction' do
        expect(@board.opposite_adjacent_match(3, 2, :blue, :top_right, 3))
          .to eq(:blue)
      end
    end

    context 'it returns nil when the color does not have 4 in a row from any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(nil)
      end

      example 'the right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :right, 1)).to eq(nil)
      end

      example 'the bottom right direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_right, 1))
          .to eq(nil)
      end

      example 'the bottom direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom, 1))
          .to eq(nil)
      end

      example 'the bottom left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :bottom_left, 1))
          .to eq(nil)
      end

      example 'the left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :left, 1)).to eq(nil)
      end

      example 'the top left direction' do
        expect(@board.first_adjacent_match(3, 2, :blue, :top_right, 1))
          .to eq(nil)
      end
    end
  end

  describe '#another_adjacent_match' do
    before(:each) do
      @board.set_turns([@turn_1]) # bypass the guard clause in #winner
    end

    context 'it returns the color when it has 4 in a row in any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :blue, :blue, :blue, :blue, :white, :white],
          [:red, :blue, :blue, :blue, :red, :white, :white],
          [:blue, :red, :blue, :red, :blue, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.another_adjacent_match(5, 0, :blue, :top_right, 1))
          .to eq(:blue)
      end

      example 'the right direction' do
        expect(@board.another_adjacent_match(3, 0, :blue, :right, 1)).to eq(:blue)
      end

      example 'the bottom right direction' do
        expect(@board.another_adjacent_match(1, 0, :blue, :bottom_right, 1))
          .to eq(:blue)
      end

      example 'the bottom direction' do
        expect(@board.another_adjacent_match(1, 2, :blue, :bottom, 1))
          .to eq(:blue)
      end

      example 'the bottom left direction' do
        expect(@board.first_adjacent_match(1, 4, :blue, :bottom_left, 1))
          .to eq(:blue)
      end

      example 'the left direction' do
        expect(@board.another_adjacent_match(3, 4, :blue, :left, 1)).to eq(:blue)
      end

      example 'the top left direction' do
        expect(@board.another_adjacent_match(5, 4, :blue, :top_left, 1))
          .to eq(:blue)
      end
    end

    context 'it returns nil when the color does not have 4 in a row from any direction' do
      before(:each) do
        slots = [
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :blue, :blue, :blue, :white, :white, :white],
          [:white, :white, :white, :white, :white, :white, :white]
        ]
        @board.set_slots(slots)
      end

      example 'the top right direction' do
        expect(@board.another_adjacent_match(4, 1, :blue, :top_right, 1))
          .to eq(nil)
      end

      example 'the right direction' do
        expect(@board.another_adjacent_match(3, 1, :blue, :right, 1)).to eq(nil)
      end

      example 'the bottom right direction' do
        expect(@board.another_adjacent_match(2, 1, :blue, :bottom_right, 1))
          .to eq(nil)
      end

      example 'the bottom direction' do
        expect(@board.another_adjacent_match(2, 2, :blue, :bottom, 1))
          .to eq(nil)
      end

      example 'the bottom left direction' do
        expect(@board.another_adjacent_match(2, 3, :blue, :bottom_left, 1))
          .to eq(nil)
      end

      example 'the left direction' do
        expect(@board.another_adjacent_match(3, 3, :blue, :left, 1)).to eq(nil)
      end

      example 'the top left direction' do
        expect(@board.another_adjacent_match(4, 3, :blue, :top_left, 1))
          .to eq(nil)
      end
    end
  end
end
