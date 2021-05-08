module GameModules
    module Levels
        class LevelOne < Level
            # Story timeout to next scene
            TIMEOUT = 90
            
            def initialize
                play_starting_scene
                super
                start
            end
            
            # start level
            def start
                Scene.play('lvl01_05', TIMEOUT, {static: true})
                resturant_frontdoor
            end

            # starting scene
            def play_starting_scene
                # Story Starting Scenes
                Scene.play('lvl01_01', TIMEOUT, { name: 'Fadein', direction: 'bottom', static: true})
                Scene.play('lvl01_02', TIMEOUT, { name: 'Fadein', direction: 'bottom', static: true})
                Scene.play('lvl01_03', TIMEOUT, { name: 'Fadein', direction: 'top', static: true})
                Scene.play('lvl01_04', TIMEOUT, { name: 'Fadein', direction: 'bottom', static: true})
            end

            # EasterEgg :D
            def resturant_hall
                Scene.play('lvl01_07', 0)
                GameMenu.select('What are you going to say', {
                    "Say nothing and back outside": method(:resturant_frontdoor),
                    "I forgot my key, pretend the keys in the table is yours": method(:take_keys),
                    "I am not going anywhere (throw the food)": method(:throw_food),
                })
            end

            def take_keys
                @adventurer.character.heal(20)
                start_journey
            end

            # this will end the game 🙊
            def throw_food
                GameModules::Main.game_over
            end

            def start_journey
                GameModules::Areas::Road.new @adventurer
            end

            # This function should lead to 5 instances
            # 1 - Mountains
            # 2 - Tides of Time
            # 3 - Deserted city
            # 4 - Ghosts Forest
            # 5 - Construction Area
            def resturant_frontdoor
                Scene.play('lvl01_06', 0)
                GameMenu.select('What are you going to do', {
                    "Put the food in your bag and move forward": method(:start_journey),
                    "Go Back inside": method(:resturant_hall),
                })
            end
        end
    end
end