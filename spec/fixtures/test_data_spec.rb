module TestData
  INITIAL_GRID = []
  6.times{ |row| INITIAL_GRID << [('.' * 7).chars] }
  INITIAL_GRID.freeze
end
