module GameModules
  class About
    def self.start
      # Show the about screen
      DrawingEngine.draw_with_animation(
        Loader.db_ascii_model(Environment, 'about_screen'),
        'Fadein',
        'bottom',
      )

      # Main Menu
      GameMenu.select({
        "Return to Main Screen": method(:return_to_main),
        "Quit": method(:quit)
      })
    end

    def self.return_to_main
      Main.start
    end

    def self.quit
      system("clear")
      exit
    end
  end
end