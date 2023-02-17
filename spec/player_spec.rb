require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player = Player.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@player).to be_a(Player)
    end
  end
end
