module TestData
  INITIAL_GRID = []
  6.times{ |row| INITIAL_GRID << ('.' * 7).chars }
  INITIAL_GRID.freeze

  PLAYER_1 = {
    name: 'Branden'
  }.freeze

  PLAYER_2 = {
    name: 'Alec'
  }.freeze
end
