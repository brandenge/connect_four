module Messages

  HUMAN_WIN_MESSAGE = <<-HUMAN_WIN

    ░█████╗░░█████╗░███╗░░██╗░██████╗░██████╗░░█████╗░████████╗██╗░░░██╗██╗░░░░░░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
    ██╔══██╗██╔══██╗████╗░██║██╔════╝░██╔══██╗██╔══██╗╚══██╔══╝██║░░░██║██║░░░░░██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
    ██║░░╚═╝██║░░██║██╔██╗██║██║░░██╗░██████╔╝███████║░░░██║░░░██║░░░██║██║░░░░░███████║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
    ██║░░██╗██║░░██║██║╚████║██║░░╚██╗██╔══██╗██╔══██║░░░██║░░░██║░░░██║██║░░░░░██╔══██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
    ╚█████╔╝╚█████╔╝██║░╚███║╚██████╔╝██║░░██║██║░░██║░░░██║░░░╚██████╔╝███████╗██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
    ░╚════╝░░╚════╝░╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░

    ██╗░░██╗██╗░░░██╗███╗░░░███╗░█████╗░███╗░░██╗░░░    ██╗░░░██╗░█████╗░██╗░░░██╗    ░█████╗░██████╗░███████╗
    ██║░░██║██║░░░██║████╗░████║██╔══██╗████╗░██║░░░    ╚██╗░██╔╝██╔══██╗██║░░░██║    ██╔══██╗██╔══██╗██╔════╝
    ███████║██║░░░██║██╔████╔██║███████║██╔██╗██║░░░    ░╚████╔╝░██║░░██║██║░░░██║    ███████║██████╔╝█████╗░░
    ██╔══██║██║░░░██║██║╚██╔╝██║██╔══██║██║╚████║██╗    ░░╚██╔╝░░██║░░██║██║░░░██║    ██╔══██║██╔══██╗██╔══╝░░
    ██║░░██║╚██████╔╝██║░╚═╝░██║██║░░██║██║░╚███║╚█║    ░░░██║░░░╚█████╔╝╚██████╔╝    ██║░░██║██║░░██║███████╗
    ╚═╝░░╚═╝░╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚╝    ░░░╚═╝░░░░╚════╝░░╚═════╝░    ╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

    ██╗░░░██╗██╗░█████╗░████████╗░█████╗░██████╗░██╗░█████╗░██╗░░░██╗░██████╗
    ██║░░░██║██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██║██╔══██╗██║░░░██║██╔════╝
    ╚██╗░██╔╝██║██║░░╚═╝░░░██║░░░██║░░██║██████╔╝██║██║░░██║██║░░░██║╚█████╗░
    ░╚████╔╝░██║██║░░██╗░░░██║░░░██║░░██║██╔══██╗██║██║░░██║██║░░░██║░╚═══██╗
    ░░╚██╔╝░░██║╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║██║╚█████╔╝╚██████╔╝██████╔╝
    ░░░╚═╝░░░╚═╝░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░╚════╝░░╚═════╝░╚═════╝░

  HUMAN_WIN

  COMPUTER_WIN_MESSAGE = <<-COMPUTER_WIN

    ░██████╗░█████╗░██████╗░██████╗░██╗░░░██╗░░░    ██╗░░░██╗░█████╗░██╗░░░██╗    ██╗░░██╗░█████╗░██╗░░░██╗███████╗
    ██╔════╝██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝░░░    ╚██╗░██╔╝██╔══██╗██║░░░██║    ██║░░██║██╔══██╗██║░░░██║██╔════╝
    ╚█████╗░██║░░██║██████╔╝██████╔╝░╚████╔╝░░░░    ░╚████╔╝░██║░░██║██║░░░██║    ███████║███████║╚██╗░██╔╝█████╗░░
    ░╚═══██╗██║░░██║██╔══██╗██╔══██╗░░╚██╔╝░░██╗    ░░╚██╔╝░░██║░░██║██║░░░██║    ██╔══██║██╔══██║░╚████╔╝░██╔══╝░░
    ██████╔╝╚█████╔╝██║░░██║██║░░██║░░░██║░░░╚█║    ░░░██║░░░╚█████╔╝╚██████╔╝    ██║░░██║██║░░██║░░╚██╔╝░░███████╗
    ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚╝    ░░░╚═╝░░░░╚════╝░░╚═════╝░    ╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝

    ██████╗░███████╗███████╗███╗░░██╗    ░█████╗░██╗░░░██╗████████╗░██████╗███╗░░░███╗░█████╗░██████╗░████████╗███████╗██████╗░
    ██╔══██╗██╔════╝██╔════╝████╗░██║    ██╔══██╗██║░░░██║╚══██╔══╝██╔════╝████╗░████║██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
    ██████╦╝█████╗░░█████╗░░██╔██╗██║    ██║░░██║██║░░░██║░░░██║░░░╚█████╗░██╔████╔██║███████║██████╔╝░░░██║░░░█████╗░░██║░░██║
    ██╔══██╗██╔══╝░░██╔══╝░░██║╚████║    ██║░░██║██║░░░██║░░░██║░░░░╚═══██╗██║╚██╔╝██║██╔══██║██╔══██╗░░░██║░░░██╔══╝░░██║░░██║
    ██████╦╝███████╗███████╗██║░╚███║    ╚█████╔╝╚██████╔╝░░░██║░░░██████╔╝██║░╚═╝░██║██║░░██║██║░░██║░░░██║░░░███████╗██████╔╝
    ╚═════╝░╚══════╝╚══════╝╚═╝░░╚══╝    ░╚════╝░░╚═════╝░░░░╚═╝░░░╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░

    ██████╗░██╗░░░██╗    ████████╗██╗░░██╗███████╗    ░█████╗░░█████╗░███╗░░░███╗██████╗░██╗░░░██╗████████╗███████╗██████╗░
    ██╔══██╗╚██╗░██╔╝    ╚══██╔══╝██║░░██║██╔════╝    ██╔══██╗██╔══██╗████╗░████║██╔══██╗██║░░░██║╚══██╔══╝██╔════╝██╔══██╗
    ██████╦╝░╚████╔╝░    ░░░██║░░░███████║█████╗░░    ██║░░╚═╝██║░░██║██╔████╔██║██████╔╝██║░░░██║░░░██║░░░█████╗░░██████╔╝
    ██╔══██╗░░╚██╔╝░░    ░░░██║░░░██╔══██║██╔══╝░░    ██║░░██╗██║░░██║██║╚██╔╝██║██╔═══╝░██║░░░██║░░░██║░░░██╔══╝░░██╔══██╗
    ██████╦╝░░░██║░░░    ░░░██║░░░██║░░██║███████╗    ╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░░░░░╚██████╔╝░░░██║░░░███████╗██║░░██║
    ╚═════╝░░░░╚═╝░░░    ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝    ░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝

    ████████╗██████╗░██╗░░░██╗    ░█████╗░░██████╗░░█████╗░██╗███╗░░██╗░░░
    ╚══██╔══╝██╔══██╗╚██╗░██╔╝    ██╔══██╗██╔════╝░██╔══██╗██║████╗░██║░░░
    ░░░██║░░░██████╔╝░╚████╔╝░    ███████║██║░░██╗░███████║██║██╔██╗██║░░░
    ░░░██║░░░██╔══██╗░░╚██╔╝░░    ██╔══██║██║░░╚██╗██╔══██║██║██║╚████║░░░
    ░░░██║░░░██║░░██║░░░██║░░░    ██║░░██║╚██████╔╝██║░░██║██║██║░╚███║██╗
    ░░░╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░    ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚═╝

  COMPUTER_WIN

  DRAW_MESSAGE = <<-DRAW

    ░██████╗░█████╗░██████╗░██████╗░██╗░░░██╗░░░    ████████╗██╗░░██╗███████╗    ░██████╗░░█████╗░███╗░░░███╗███████╗
    ██╔════╝██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝░░░    ╚══██╔══╝██║░░██║██╔════╝    ██╔════╝░██╔══██╗████╗░████║██╔════╝
    ╚█████╗░██║░░██║██████╔╝██████╔╝░╚████╔╝░░░░    ░░░██║░░░███████║█████╗░░    ██║░░██╗░███████║██╔████╔██║█████╗░░
    ░╚═══██╗██║░░██║██╔══██╗██╔══██╗░░╚██╔╝░░██╗    ░░░██║░░░██╔══██║██╔══╝░░    ██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░
    ██████╔╝╚█████╔╝██║░░██║██║░░██║░░░██║░░░╚█║    ░░░██║░░░██║░░██║███████╗    ╚██████╔╝██║░░██║██║░╚═╝░██║███████╗
    ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚╝    ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝    ░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝

    ██╗░░██╗░█████╗░░██████╗    ██████╗░███████╗░██████╗██╗░░░██╗██╗░░░░░████████╗███████╗██████╗░    ██╗███╗░░██╗
    ██║░░██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝██╔════╝██║░░░██║██║░░░░░╚══██╔══╝██╔════╝██╔══██╗    ██║████╗░██║
    ███████║███████║╚█████╗░    ██████╔╝█████╗░░╚█████╗░██║░░░██║██║░░░░░░░░██║░░░█████╗░░██║░░██║    ██║██╔██╗██║
    ██╔══██║██╔══██║░╚═══██╗    ██╔══██╗██╔══╝░░░╚═══██╗██║░░░██║██║░░░░░░░░██║░░░██╔══╝░░██║░░██║    ██║██║╚████║
    ██║░░██║██║░░██║██████╔╝    ██║░░██║███████╗██████╔╝╚██████╔╝███████╗░░░██║░░░███████╗██████╔╝    ██║██║░╚███║
    ╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░    ╚═╝░░╚═╝╚══════╝╚═════╝░░╚═════╝░╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░    ╚═╝╚═╝░░╚══╝

    ░█████╗░    ██████╗░██████╗░░█████╗░░██╗░░░░░░░██╗░░░    ████████╗██████╗░██╗░░░██╗
    ██╔══██╗    ██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║░░░    ╚══██╔══╝██╔══██╗╚██╗░██╔╝
    ███████║    ██║░░██║██████╔╝███████║░╚██╗████╗██╔╝░░░    ░░░██║░░░██████╔╝░╚████╔╝░
    ██╔══██║    ██║░░██║██╔══██╗██╔══██║░░████╔═████║░░░░    ░░░██║░░░██╔══██╗░░╚██╔╝░░
    ██║░░██║    ██████╔╝██║░░██║██║░░██║░░╚██╔╝░╚██╔╝░██╗    ░░░██║░░░██║░░██║░░░██║░░░
    ╚═╝░░╚═╝    ╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝    ░░░╚═╝░░░╚═╝░░╚═╝░░░╚═╝░░░

    ░█████╗░░██████╗░░█████╗░██╗███╗░░██╗░░░
    ██╔══██╗██╔════╝░██╔══██╗██║████╗░██║░░░
    ███████║██║░░██╗░███████║██║██╔██╗██║░░░
    ██╔══██║██║░░╚██╗██╔══██║██║██║╚████║░░░
    ██║░░██║╚██████╔╝██║░░██║██║██║░╚███║██╗
    ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝╚═╝

  DRAW

  WELCOME_MESSAGE = <<-WELCOME

                                      ░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗    ████████╗░█████╗░
                                      ░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝    ╚══██╔══╝██╔══██╗
                                      ░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░    ░░░██║░░░██║░░██║
                                      ░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░    ░░░██║░░░██║░░██║
                                      ░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗    ░░░██║░░░╚█████╔╝
                                      ░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝    ░░░╚═╝░░░░╚════╝░

                                              ░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗░█████╗░████████╗    ░░██╗██╗
                                              ██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗╚══██╔══╝    ░██╔╝██║
                                              ██║░░╚═╝██║░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░╚═╝░░░██║░░░    ██╔╝░██║
                                              ██║░░██╗██║░░██║██║╚████║██║╚████║██╔══╝░░██║░░██╗░░░██║░░░    ███████║
                                              ╚█████╔╝╚█████╔╝██║░╚███║██║░╚███║███████╗╚█████╔╝░░░██║░░░    ╚════██║
                                              ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░    ░░░░░╚═╝

  WELCOME

  COLUMN_TEXT = <<-COLUMN
        ░█████╗░  ██████╗░  ░█████╗░  ██████╗░  ███████╗  ███████╗  ░██████╗░
        ██╔══██╗  ██╔══██╗  ██╔══██╗  ██╔══██╗  ██╔════╝  ██╔════╝  ██╔════╝░
        ███████║  ██████╦╝  ██║░░╚═╝  ██║░░██║  █████╗░░  █████╗░░  ██║░░██╗░
        ██╔══██║  ██╔══██╗  ██║░░██╗  ██║░░██║  ██╔══╝░░  ██╔══╝░░  ██║░░╚██╗
        ██║░░██║  ██████╦╝  ╚█████╔╝  ██████╔╝  ███████╗  ██║░░░░░  ╚██████╔╝
        ╚═╝░░╚═╝  ╚═════╝░  ░╚════╝░  ╚═════╝░  ╚══════╝  ╚═╝░░░░░  ░╚═════╝░
  COLUMN

  GAME_PLAY_PROMPT = <<-PLAY_PROMPT

                        ███████╗███╗░░██╗████████╗███████╗██████╗░  ██╗██████╗░██╗  ████████╗░█████╗░  ██████╗░██╗░░░░░░█████╗░██╗░░░██╗
                        ██╔════╝████╗░██║╚══██╔══╝██╔════╝██╔══██╗  ╚█║██╔══██╗╚█║  ╚══██╔══╝██╔══██╗  ██╔══██╗██║░░░░░██╔══██╗╚██╗░██╔╝
                        █████╗░░██╔██╗██║░░░██║░░░█████╗░░██████╔╝  ░╚╝██████╔╝░╚╝  ░░░██║░░░██║░░██║  ██████╔╝██║░░░░░███████║░╚████╔╝░
                        ██╔══╝░░██║╚████║░░░██║░░░██╔══╝░░██╔══██╗  ░░░██╔═══╝░░░░  ░░░██║░░░██║░░██║  ██╔═══╝░██║░░░░░██╔══██║░░╚██╔╝░░
                        ███████╗██║░╚███║░░░██║░░░███████╗██║░░██║  ░░░██║░░░░░░░░  ░░░██║░░░╚█████╔╝  ██║░░░░░███████╗██║░░██║░░░██║░░░
                        ╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝  ░░░╚═╝░░░░░░░░  ░░░╚═╝░░░░╚════╝░  ╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░

                                                                        ░█████╗░██████╗░
                                                                        ██╔══██╗██╔══██╗
                                                                        ██║░░██║██████╔╝
                                                                        ██║░░██║██╔══██╗
                                                                        ╚█████╔╝██║░░██║
                                                                        ░╚════╝░╚═╝░░╚═╝

                          
                                          ███████╗███╗░░██╗████████╗███████╗██████╗░  ██╗░██████╗░██╗  ████████╗░█████╗░
                                          ██╔════╝████╗░██║╚══██╔══╝██╔════╝██╔══██╗  ╚█║██╔═══██╗╚█║  ╚══██╔══╝██╔══██╗
                                          █████╗░░██╔██╗██║░░░██║░░░█████╗░░██████╔╝  ░╚╝██║██╗██║░╚╝  ░░░██║░░░██║░░██║
                                          ██╔══╝░░██║╚████║░░░██║░░░██╔══╝░░██╔══██╗  ░░░╚██████╔╝░░░  ░░░██║░░░██║░░██║
                                          ███████╗██║░╚███║░░░██║░░░███████╗██║░░██║  ░░░░╚═██╔═╝░░░░  ░░░██║░░░╚█████╔╝
                                          ╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝  ░░░░░░╚═╝░░░░░░  ░░░╚═╝░░░░╚════╝░

                                                                  ░██████╗░██╗░░░██╗██╗████████╗
                                                                  ██╔═══██╗██║░░░██║██║╚══██╔══╝
                                                                  ██║██╗██║██║░░░██║██║░░░██║░░░
                                                                  ╚██████╔╝██║░░░██║██║░░░██║░░░
                                                                  ░╚═██╔═╝░╚██████╔╝██║░░░██║░░░
                                                                  ░░░╚═╝░░░░╚═════╝░╚═╝░░░╚═╝░░░

  PLAY_PROMPT

  BEEP_BOOP_BOP = <<-BEEP
        █▄▄ █▀▀ █▀▀ █▀█   █▄▄ █▀█ █▀█ █▀█   █▄▄ █▀█ █▀█
        █▄█ ██▄ ██▄ █▀▀   █▄█ █▄█ █▄█ █▀▀   █▄█ █▄█ █▀▀
  BEEP

end
