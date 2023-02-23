require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

require './lib/connect_four_2301/game'
require './lib/connect_four_2301/board'
require './lib/connect_four_2301/player'
require './lib/connect_four_2301/turn'
require './fixtures/test_data_spec'
require './fixtures/board_test_methods_spec'

include TestData

class Board
  include BoardTestMethods
end

# frozen_string_literal: true

require "connect_four_2301"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
