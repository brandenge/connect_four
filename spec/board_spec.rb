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

  describe '#grid' do
    it 'has a grid' do
      expect(@board.grid).to eq([])
    end
  end

  describe '#initialize_board' do
    it 'modifies the @grid' do
      @board.initialize_board
      expect(@board.grid).to eq(INITIAL_GRID)
    end

    it 'returns the initial grid' do
      expect(@board.initialize_board).to eq(INITIAL_GRID)
    end
  end

  describe '#render_board' do
    it 'returns the updated grid' do
      @board.initialize_board
      expect(@board.render_board).to eq(INITIAL_GRID)
    end
  end
end
