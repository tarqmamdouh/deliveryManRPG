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
        end
    end
end