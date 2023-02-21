require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)

    @turn_1 = Turn.new(@player_1, 5, 0)
    @turn_2 = Turn.new(@player_2, 5, 1)
    @turn_3 = Turn.new(@player_1, 4, 0)
    @turn_4 = Turn.new(@player_2, 4, 1)
    @turn_5 = Turn.new(@player_1, 3, 0)
    @turn_6 = Turn.new(@player_2, 3, 1)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@turn_1).to be_a(Turn)
    end
  end

  describe 'has attributes' do
    it 'has a player' do
      expect(@turn_1.player).to be_a(Player)
    end

    it 'has a row' do
      expect(@turn_1.row).to eq(5)
    end

    it 'has a column' do
      expect(@turn_1.col).to eq(0)
    end

    it 'has timestamp' do
      expect(@turn_1.timestamp).to be_a(DateTime)
    end
  end
end
