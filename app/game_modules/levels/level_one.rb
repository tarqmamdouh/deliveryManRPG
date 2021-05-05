module GameModules
    module Levels
        class LevelOne < Level
            attr_reader :adventurer
            
            def initialize
                play_starting_scene
                super
            end
            
            # start level
            def start; end

            # starting scene
            def play_starting_scene
                # Story Starting Scenes
                Scene.play('lvl01_01', 90, { name: 'Fadein', direction: 'right', story: true})
                Scene.play('lvl01_02', 90, { name: 'Fadein', direction: 'bottom', story: true})
                Scene.play('lvl01_03', 90, { name: 'Fadein', direction: 'top', story: true})
                Scene.play('lvl01_04', 90, { name: 'Fadein', direction: 'bottom', story: true})
            end
        end
    end
end