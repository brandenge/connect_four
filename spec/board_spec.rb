
RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@board).to be_a(Board)
    end
  end
end
