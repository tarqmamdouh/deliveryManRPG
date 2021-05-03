# Class intended to start the game and show the main menu
module GameModules
  # Menus prompt
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
        'right',
      )

      # Main Menu
      GameMenu.select("Welcome, choose your option:", {
        "New Game": method(:new_game),
        "About": method(:about),
        "Quit": method(:quit)
      })
    end

    def self.new_game
    end

    def self.about
      About.start
    end

    def self.quit
      system("clear")
      exit
    end
  end
end