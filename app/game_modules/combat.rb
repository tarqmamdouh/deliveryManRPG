module GameModules
    class Combat
        attr_reader :hp_lost
    
        def initialize(adventurer, monster)
            yield
            Main.game_over if adventurer.character.dead?
        end
    end
end