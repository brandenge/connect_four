
RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_a(Board)
    end
  end

  describe '#grid' do
    it 'has a grid' do
      expect(@board.grid).to eq(INITIAL_GRID)
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
      expect(@board.print_board).to eq(INITIAL_GRID)
    end
  end
end
