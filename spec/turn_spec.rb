require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @turn = Turn.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@turn).to be_a(Turn)
    end
  end
end
