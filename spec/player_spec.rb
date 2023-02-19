require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player = Player.new('player 1', :blue,)
    @player2 = Player.new('player 2', :red, false)
    @columns = [*('A'..'G')]
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@player).to be_a(Player)
    end
  end

  describe '#has attributes' do
    it '#is_human?' do
      expect(@player.is_human?).to eq(true)
      expect(@player2.is_human?).to eq(false)
    end

    it '#set_name' do
      expect(@player.set_name('Alec')).to eq('Alec')
    end
  end


  describe '#random_move' do
    it 'returns players column selection' do
      actual = @columns.include?(@player.random_move(@columns))
      expect(@player.random_move(@columns)).to be_a(String)
      expect(actual).to eq(true)
    end
  end
end
