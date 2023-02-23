require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

require './lib/game'
require './lib/board'
require './lib/player'
require './lib/turn'
require './fixtures/test_data_spec'
require './fixtures/board_test_methods_spec'

include TestData

class Board
  include BoardTestMethods
end
