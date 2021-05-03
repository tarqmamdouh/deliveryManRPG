# Class intended to start the game and show the main menu
module GameModules
  class Main
    def self.start
      # draw the amazing studio logo
      DrawingEngine.draw_with_animation(
        Loader.db_ascii_model(Environment, 'studio_logo'),
        'Fadein',
        'top',
      )

      # wait 3 seconds for user to see the amazing logo
      sleep(3)

      # show main screen
      DrawingEngine.draw_with_animation(
        Loader.db_ascii_model(Environment, 'main_screen'),
        'Fadein',
        'left',
        0.01
      )
      sleep(1)

    end
  end
end