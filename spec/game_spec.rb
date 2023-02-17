require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@game).to be_a(Game)
    end
  end
end
