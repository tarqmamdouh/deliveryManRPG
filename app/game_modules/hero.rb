module GameModules
  class Hero
    attr_reader :character

    def initialize
      # Draw characters
      Scene.play('character_selection_screen', 0)

      # Select one
      GameMenu.select('choose your delivery hero:', {
                        "Secret Agent": method(:secret_agent),
                        "samurai": method(:samurai),
                        "assassin": method(:assassin)
                      })
    end

    def secret_agent
      @character = find_character('agent')
    end

    def samurai
      @character = find_character('samurai')
    end

    def assassin
      @character = find_character('assassin')
    end

    def find_character(name)
      Character.find_by(name: name)
    end
  end
end
