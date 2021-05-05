module GameModules
  class About
    def self.start
      # Show the about screen
      Scene.play('about_screen', 0, {
        name: 'fadein',
        direction: 'bottom'
      })

      # Main Menu
      GameMenu.select("Choose your option:", {
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