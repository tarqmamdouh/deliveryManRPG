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
                    "You like open air and you are going to keep moving": method(:desert),
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
                Scene.play('lvl01_18', 0)
                GameMenu.select('What are you going to do', {
                    "Go Left": method(:explore_left),
                    "Go Right": method(:explore_right),
                })
            end

            def river
                River.new @adventurer
            end
            
            def enter_cave
                Cave.new @adventurer
                start
            end

            def desert
                dialog = "You found a deadly snake looking at you."
                
                spawn_monster('snake', dialog)

                GameMenu.select('What are you going to do', {
                    "Try to kill it": method(:fight_snake),
                    "Stay Still": method(:stay_still),
                    "Run": method(:run),
                })
            end

            def fight_snake
                initiate_combat(10, 30)
                GameMenu.select('Nothing else, its a dead end. What are you going to do', {
                    "Back to the cave enterance": method(:explore_right),
                    "Back to the road": method(:start),
                })
            end

            def stay_still
                Combat.new(@adventurer, @monster, true) do
                    @adventurer.character.damage(10, "You made a perfect choice, but your mobile rang, snake attacked you")
                end
                GameMenu.select('Nothing else, its a dead end. What are you going to do', {
                    "Back to the cave enterance": method(:explore_right),
                    "Back to the road": method(:start),
                })
            end

            def run
                Combat.new(@adventurer, @monster, true) do
                    @adventurer.character.damage(25, "Running is the last thing you can do when you face a snake, snake attacked you")
                end
                GameMenu.select('Nothing else, its a dead end. What are you going to do', {
                    "Back to the cave enterance": method(:explore_right),
                    "Back to the road": method(:start),
                })
            end

        end
    end
end