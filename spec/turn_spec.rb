require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)
    @turn_1 = Turn.new(@player_1, 'A')
    @turn_2 = Turn.new(@player_2, 'A')
    @turn_3 = Turn.new(@player_1, 'B')
    @turn_4 = Turn.new(@player_2, 'C')
    @turn_5 = Turn.new(@player_1, 'B')
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@turn_1).to be_a(Turn)
    end
  end

  describe '#has attributes' do
    it 'has player' do
      expect(@turn_1.player).to be_a(Player)
    end

    it 'has column selection' do 
      expect(@turn_1.column).to eq('A')
    end

    it 'has timestamp' do
      expect(@turn_1.timestamp).to be_a(DateTime)
    end
  end
end
