module GameModules
    module Areas
        class LevelArea
            def initialize(adventurer)
                @adventurer = adventurer
                start
            end

            def start; end

            # Draw monster with stats and dialog
            # name (STRING) monster name in database
            # dialog (TEXT) dialog that will appear next to monster
            def spawn_monster(name, dialog)
                @monster = Monster.find_by(name: name)
                @monster.spawn(dialog)
            end

            # Initiating combat between current character and spawn monster
            # min_damage (INTEGER) minimum damage that the character can take
            # max_damage (INTEGER) maximum damage that the character can take
            def initiate_combat(min_damage, max_damage)
                Combat.new(@adventurer, @monster, true) do |prop|
                    win = rand(100) > (100 - (prop * 100))
                    return @adventurer.character.bleed(rand(min_damage..max_damage)) if win
                    @adventurer.character.damage(min_damage, "it was too strong, you lost the fight")
                end
            end
        end
    end
end