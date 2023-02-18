module TestData
  COLORS ||= {
    blue: '[0;1;30;90;46m [0m',
    white: '[0;37;5;47;107m [0m',
    red: '[0;31;5;41;101m [0m'
  }.freeze

  INITIAL_GRID ||= [*(1..6)].map do |row|
    [*(1..7)].map do |col|
      (COLORS[:white])
    end
  end.freeze

  PLAYER_1 ||= {
    name: 'Branden'
  }.freeze

  PLAYER_2 ||= {
    name: 'Alec'
  }.freeze
end
