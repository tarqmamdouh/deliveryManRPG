module GameModules
    module Areas
        class Road < LevelArea

            def start
                Scene.play('lvl01_08', 0)
                GameMenu.select('What are you going to do', {
                    "Move forward and climb the mountains": method(:climb),
                    "Move right searching for any other route": method(:explore_right),
                    "Move left searching for any other route": method(:explore_left),
                })
            end

            def explore_right
                Scene.play('lvl01_09', 0)
                GameMenu.select('What are you going to do', {
                    "Enter the cave": method(:enter_cave),
                    "You like open air and you are going to keep moving": method(:deserted_city),
                    "You prefer to return back": method(:start),
                })
            end

            def explore_left
                Scene.play('lvl01_10', 0)
                GameMenu.select('What are you going to do', {
                    "Go near the river": method(:river),
                    "You prefer to return back": method(:start),
                })
            end

            def climb
                Mountains.new @adventurer
            end

            def river
                River.new @adventurer
            end
            
            def enter_cave
                Cave.new @adventurer
            end

            def deserted_city
                City.new @adventurer
            end
        end
    end
end