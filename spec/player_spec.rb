require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player_1 = Player.new(*PLAYER_1.values)
    @player_2 = Player.new(*PLAYER_2.values)
    @columns = [*('A'..'G')]
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@player_1).to be_a(Player)
      expect(@player_2).to be_a(Player)
    end
  end

  describe '#has attributes' do
    it 'has a name' do
      expect(@player_1.name).to eq('Branden')
      expect(@player_2.name).to eq('Alec')
    end

    it 'has a color' do
      expect(@player_1.color).to eq(:blue)
      expect(@player_2.color).to eq(:red)
    end
  end

  describe '#is_human?' do
    it 'returns true when the player is human' do
      expect(@player_1.is_human?).to eq(true)
    end

    it 'returns false when the player is a computer' do
      expect(@player_2.is_human?).to eq(false)
    end

    it 'defaults to true if not given at Player instantiation' do
      new_player = Player.new('Tom', :blue)
      expect(new_player.is_human?).to eq(true)
    end
  end

  describe '#set_name' do
    it 'sets the player name to a different name' do
      expect(@player_1.name).to eq(PLAYER_1[:name])
      @player_1.set_name('Joe Bob')
      expect(@player_1.name).to eq('Joe Bob')
    end

    it 'returns nil' do
      expect(@player_1.set_name('Joe Bob')).to eq(nil)
    end
  end
end
