require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)

    @turn_1 = Turn.new(5, 0, :blue)
    @turn_2 = Turn.new(5, 1, :red)
    @turn_3 = Turn.new(4, 0, :blue)
    @turn_4 = Turn.new(4, 1, :red)
    @turn_5 = Turn.new(3, 0, :blue)
    @turn_6 = Turn.new(3, 1, :red)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@turn_1).to be_a(Turn)
    end
  end

  describe 'has attributes' do
    it 'has a row' do
      expect(@turn_1.row).to eq(5)
    end

    it 'has a column' do
      expect(@turn_1.col).to eq(0)
    end

    it 'has a color' do
      expect(@turn_1.color).to be_a(Symbol)
    end

    it 'has timestamp' do
      expect(@turn_1.timestamp).to be_a(DateTime)
    end
  end
end
