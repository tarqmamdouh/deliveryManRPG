module GameModules
    module Levels
        class LevelOne < Level
            attr_reader :adventurer

            # Story timeout to next scene
            TIMEOUT = 90
            
            def initialize
                play_starting_scene
                super
                start
            end
            
            # start level
            def start
                Scene.play('lvl01_05', TIMEOUT, { story: true})
            end

            # starting scene
            def play_starting_scene
                # Story Starting Scenes
                Scene.play('lvl01_01', TIMEOUT, { name: 'Fadein', direction: 'left', story: true})
                Scene.play('lvl01_02', TIMEOUT, { name: 'Fadein', direction: 'bottom', story: true})
                Scene.play('lvl01_03', TIMEOUT, { name: 'Fadein', direction: 'top', story: true})
                Scene.play('lvl01_04', TIMEOUT, { name: 'Fadein', direction: 'bottom', story: true})
            end
        end
    end
end