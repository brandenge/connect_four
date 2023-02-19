require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new

    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)

    @turn_1 = Turn.new(@player_1, 'A')
    @turn_2 = Turn.new(@player_2, 'B')
    @turn_3 = Turn.new(@player_1, 'A')
    @turn_4 = Turn.new(@player_2, 'B')
    @turn_5 = Turn.new(@player_1, 'A')
    @turn_6 = Turn.new(@player_2, 'B')
    @turn_7 = Turn.new(@player_1, 'A')
    @turn_8 = Turn.new(@player_2, 'B')
    @turn_9 = Turn.new(@player_1, 'A')
    @turn_10 = Turn.new(@player_2, 'B')
    @turn_11 = Turn.new(@player_1, 'A')

    def @board.columns
      @columns
    end

    def @board.set_turns(turns)
      @turns = turns
    end

    @mock_grid = [*(1..6)].map do |row|
      [*(1..7)].map { |col| COLORS[:white] }
    end

    def mock_turn(token, column)
      @mock_grid[find_lowest_row(column)][@board.columns.find(column)] = token
    end
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_a(Board)
    end
  end

  describe 'COLORS constant' do
    it 'has a colors constant for the possible colors in the grid' do
      expect(Board::COLORS).to eq(COLORS)
    end
  end

  describe '@@columns' do
    it 'has a columns class variable for storing an array of columns' do
      it 'is an array of all of the columns of the board/grid' do
        expect(Board.columns).to eq([*('A'..'G')])
      end
    end
  end

  describe '#grid' do
    it 'has a grid' do
      expect(@board.grid).to eq(INITIAL_GRID)
    end
  end

  describe '#turns' do
    it 'starts empty' do
      expect(@board.turns.empty?).to eq(true)
    end

    it 'returns an array of Turn objects' do
      @board.next_turn(@player_1)
      @board.next_turn(@player_2)
      actual = @board.next_turn(@player_1).all? { |turn| turn.is_a?(Turn) }
      expect(actual).to eq(true)
    end
  end

  describe '#initialize_board' do
    it 'returns the initial grid' do
      expect(@board.initialize_board).to eq(INITIAL_GRID)
    end
  end

  describe '#render' do
    it 'returns the updated grid' do
      expect(@board.render).to eq(INITIAL_GRID)
    end
  end

  describe '#next_turn' do
    it 'returns an array of Turn objects' do
      expect(@board.next_turn(@player_1))
    end

    it 'adds a Turn object to the array of turns' do
      @board.next_turn(@player_1)
      expect(@board.turns.count).to eq(1)
      @board.next_turn(@player_2)
      expect(@board.turns.count).to eq(2)
      @board.next_turn(@player_1)
      expect(@board.turns.count).to eq(3)
    end
  end

  describe '#update' do
    it 'does nothing at the start' do
      @board.update
      expect(@board.grid).to eq(INITIAL_GRID)
    end

    it 'returns nil' do
      expect(@board.update).to eq(nil)
    end

    it 'it updates the board after 1 turn' do
      mock_turn(@player_1.token, 'A')
      @board.set_turns([@turn_1])
      @board.update
      expect(@board.grid).to eq(@mock_grid)
    end

    it 'it updates the board after 2 turns' do
      mock_turn(@player_1.token, 'A')
      mock_turn(@player_2.token, 'B')
      @board.set_turns([@turn_1, @turn_2])
      @board.update
      expect(@board.grid).to eq(@mock_grid)
    end

    it 'it updates the board after 3 turns' do
      mock_turn(@player_1.token, 'A')
      mock_turn(@player_2.token, 'B')
      mock_turn(@player_1.token, 'A')
      @board.set_turns([@turn_1, @turn_2, @turn_3])
      @board.update
      expect(@board.grid).to eq(@mock_grid)
    end

    it 'updates the board after many turns' do
      mock_turn(@player_1.token, 'A')
      mock_turn(@player_2.token, 'B')
      mock_turn(@player_1.token, 'A')
      mock_turn(@player_2.token, 'B')
      mock_turn(@player_1.token, 'A')
      mock_turn(@player_2.token, 'B')
      mock_turn(@player_1.token, 'A')
      @board.set_turns([@turn_1, @turn_2, @turn_3, @turn_4, @turn_5, @turn_6, @turn_7])
      @board.update
      expect(@board.grid).to eq(@mock_grid)
    end
  end

  describe '#find_lowest_row' do
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
      @mock_grid = [*(1..6)].map do |row|
        [*(1..7)].map { |col| COLORS[:blue] }
      end
      expect(@board.valid_columns).to eq([])
    end
  end

  describe '#winner' do
    it 'returns nil when there is no winner' do
      expect(@board.winner).to eq(nil)
    end

    it 'returns the winning player\'s color when they have won' do
      @board.set_turns([@turn_1, @turn_2, @turn_3, @turn_4, @turn_5, @turn_6, @turn_7])
      @board.update
      expect(@board.winner).to eq(:blue)
    end

    it 'returns a different winning player\'s color when they have won' do
      @board.set_turns([@turn_1, @turn_2, @turn_4, @turn_5, @turn_6, @turn_7, @turn_8])
      @board.update
      expect(@board.winner).to eq(:red)
    end
  end
end
