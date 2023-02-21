require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new

    def @game.players
      @players
    end
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@game).to be_a(Game)
    end
  end

  describe '#attributes' do
    it 'has players' do
      actual = @game.players.all? { |player| player.is_a?(Player) }
      expect(actual).to eq(true)
    end
  end
end
