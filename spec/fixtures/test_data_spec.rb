module TestData
  COLORS ||= {
    blue: '[0;36;5;44;104mX[0m',
    white: '[0;37;5;47;107m.[0m',
    red: '[0;31;5;41;101mO[0m'
  }.freeze

  PLAYER_1 ||= {
    name: 'Branden',
    token: :blue,
    is_human: false
  }.freeze

  PLAYER_2 ||= {
    name: 'Alec',
    token: :red,
    is_human: false
  }.freeze
end
