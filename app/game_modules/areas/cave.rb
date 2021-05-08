module GameModules
  module Areas
    class Cave < LevelArea
      def start
        Scene.play('lvl01_19', 50, {
                     static: true
                   })
        enterance
      end

      def enterance
        dialog = 'You saw a dragon running on your way!'

        spawn_monster('dragon', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_dragon),
                          "Get down and hide quickly": method(:hide),
                          "Run": method(:run)
                        })
      end

      def fight_dragon
        initiate_combat(40, 65)
        GameMenu.select('What are you going to do', {
                          "Explore the cave": method(:explore),
                          "Return to road": method(:return_road)
                        })
      end

      def hide
        Combat.new(@adventurer, @monster, true) do |_prop|
          @adventurer.character.damage(0, 'You sneaked out from the dragon')
        end
        GameMenu.select('Dragon flied away, What are you going to do', {
                          "Explore the cave silently": method(:explore),
                          "Get out from the cave": method(:return_road),
                          "Run": method(:face_mother)
                        })
      end

      def explore
        @adventurer.character.heal(40)
        GameMenu.select('What are you going to do', {
                          "Carry the dragon egg": method(:face_mother),
                          "Exit The cave": method(:return_road)
                        })
      end

      def face_mother
        dialog = 'another dragon is here!'

        spawn_monster('dragon', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_dragon),
                          "Get down and hide quickly": method(:run),
                          "Run": method(:run)
                        })
      end

      def run
        Combat.new(@adventurer, @monster, true) do
          @adventurer.character.damage(35, 'You Tried to run, but the dragon kicked your ass anyway')
        end
        GameMenu.select('Dragon flied away, What are you going to do', {
                          "Explore Cave": method(:explore),
                          "Get out from the cave": method(:return_road)
                        })
      end

      def return_road; end
    end
  end
end
