# Class intended to start the game and show the main menu
module GameModules
  # Menus prompt
  class Main
    def self.start
      # draw the amazing studio logo
      Scene.play('studio_logo', 3, {
        name: 'Fadein',
        direction: 'top'
      })

      # show main screen
      Scene.play('main_screen', 0, {
        name: 'Fadein',
        direction: 'right'
      })

      # Main Menu
      GameMenu.select("Welcome, choose your option:", {
        "New Game": method(:new_game),
        "About": method(:about),
        "Quit": method(:quit)
      })
    end

    def self.new_game
      GameModules::Levels::LevelOne.new
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