module GameModules
  module Areas
    class River < LevelArea
      def start
        Scene.play('lvl01_10', 0)
        GameMenu.select('You walked to the river, What are you going to do', {
                          "Swim": method(:swim),
                          "Explore Area searching for useful tools": method(:explore)
                        })
      end

      def swim
        Scene.play('lvl01_12', 0)
        GameMenu.select('What are you going to do', {
                          "Go to the waterfall Cave": method(:waterfall),
                          "Swim right": method(:swim_right),
                          "Swim left": method(:swim_left)
                        })
      end

      def swim_right
        GameMenu.select('Nothing here, What are you going to do', {
                          "Return to the waterfall": method(:swim),
                          "Back to the shore": method(:start)
                        })
      end

      def swim_left
        Scene.play('lvl01_11', 0)
        GameMenu.select('What are you going to do', {
                          "Rest on the island, and continue swimming at the morning": method(:island_rest),
                          "Explore the island then continue swimming": method(:explore_island),
                          "Back to waterfall": method(:swim)
                        })
      end

      def explore_island
        dialog = 'You found a small coin when you got closer to it, a devil horse appeared'

        spawn_monster('devil_horse', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_devil_horse),
                          "Throw the coin and Run": method(:island_rest),
                          "Take The coin and Run": method(:coin_run)
                        })
      end

      def coin_run
        Combat.new(@adventurer, @monster, true) do |_prop|
          @adventurer.character.damage(rand(50..80), "The coin is a curse, you should've throw it!!!")
        end
        GameMenu.select('What are you going to do', {
                          "Rest on the island, and continue swimming at the morning": method(:island_rest),
                          "Back to waterfall": method(:swim)
                        })
      end

      def fight_devil_horse
        initiate_combat(10, 30)
        GameMenu.select('Nothing else here, What are you going to do', {
                          "Continue to the next side": method(:arrive),
                          "Open dropped Box": method(:open_box)
                        })
      end

      def open_box
        @adventurer.character.damage(15, 'The box was containing a toxic gas and it damaged you')
        GameMenu.select('Nothing else here, What are you going to do', {
                          "Continue to the next side": method(:arrive),
                          "Back to the cave": method(:swim)
                        })
      end

      def island_rest
        Scene.play('lvl01_13', 0)
        GameMenu.select('Nothing else here, What are you going to do', {
                          "Continue to the next side": method(:arrive),
                          "Back to the waterfall cave": method(:swim)
                        })
      end

      def arrive
        Noval.new @adventurer
      end

      def waterfall
        dialog = "You found a cave behind the waterfall, you decided to enter. \n
                Deadly Alligator appeard in your way!"

        spawn_monster('alligator', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_alligator),
                          "Stay Still": method(:stay_still),
                          "Run": method(:run)
                        })
      end

      def fight_alligator
        initiate_combat(10, 20)
        GameMenu.select('Nothing else here, What are you going to do', {
                          "Rest, Then continue swimming in the river": method(:swim_left),
                          "Continue Swimming": method(:swim_left),
                          "Get out from the cave": method(:swim)
                        })
      end

      def stay_still
        Combat.new(@adventurer, @monster, true) do |_prop|
          @adventurer.character.damage(20, 'Alligator already saw you, you involved in a fight and lost it')
        end
        GameMenu.select('You returned to the cave, Nothing else here, What are you going to do', {
                          "Rest, Then continue swimming in the river": method(:swim_left),
                          "Continue Swimming": method(:swim_left),
                          "Get out from the cave": method(:swim)
                        })
      end

      def run
        Combat.new(@adventurer, @monster, true) do |_prop|
          @adventurer.character.damage(25, 'Alligator can swim, it run after you and you took damage')
        end
        GameMenu.select('You returned to the cave, Nothing else here, What are you going to do', {
                          "Rest, Then continue swimming in the river": method(:swim_left),
                          "Continue Swimming": method(:swim_left),
                          "Get out from the cave": method(:swim)
                        })
      end

      def explore
        Scene.play('lvl01_14', 0)
        GameMenu.select('What are you going to do', {
                          "Use what is left from the axe to cut the tree": method(:cut_tree),
                          "Use what is left from the axe to break the box": method(:break_box),
                          "Throw the axe and swim": method(:swim)
                        })
      end

      def cut_tree
        Scene.play('lvl01_15', 0)
        GameMenu.select('What are you going to do', {
                          "Sail": method(:sail),
                          "Leave the boat and swim": method(:swim),
                          "Explore More": method(:bonus)
                        })
      end

      def bonus
        @adventurer.character.heal(20)
        GameMenu.select('What are you going to do', {
                          "Swim": method(:swim),
                          "Sail with the boat": method(:sail)
                        })
      end

      def sail
        dialog = "You found a head getting out from the sea. \n
                It is a KRAKEN going to destroy your ship"

        spawn_monster('kraken', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_kraken),
                          "Navigate your boat left, try to escape from it": method(:escape_with_boat),
                          "Jump from boat and hide": method(:swim)
                        })
      end

      def fight_kraken
        initiate_combat(10, 50)
        GameMenu.select('The kraken destoyed your boat, What are you going to do', {
                          "Swim": method(:swim),
                          "Hang on to the wreck": method(:swim_left)
                        })
      end

      def escape_with_boat
        Combat.new(@adventurer, @monster, true) do |_prop|
          @adventurer.character.damage(30, 'You are going to succeed on that when the pigs fly')
        end
        GameMenu.select('The kraken destoyed your boat, What are you going to do', {
                          "Swim": method(:swim),
                          "Hang on to the wreck": method(:swim_left)
                        })
      end

      def break_box
        Scene.play('lvl01_16', 0)
        GameMenu.select('What are you going to do', {
                          "Throw the coin and run": method(:start),
                          "Go forward the voice source": method(:meet_mermaid)
                        })
      end

      def meet_mermaid
        dialog = 'You found mermaid looking at you.'

        spawn_monster('mermaid', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_mermaid),
                          "Stay Still, give her the coin": method(:friendly_mermaid),
                          "Jump in the sea and hide": method(:swim)
                        })
      end

      def fight_mermaid
        initiate_combat(1, 5)
        GameMenu.select('Mermaid dropped an axe, What are you going to do', {
                          "Cut the tree": method(:cut_tree),
                          "Swim in the sea": method(:swim)
                        })
      end

      def friendly_mermaid
        Scene.play('lvl01_mermaid_01', 0)
        GameMenu.select('What are you going to say', {
                          "I am looking for help to go to the other side": method(:mermaid_help),
                          "I want to build a boat, can you bring another axe for me?": method(:cut_tree),
                          "I don't trust you (jump in the sea and swim)": method(:swim)
                        })
      end

      def mermaid_help
        dialog = 'There is a shark following you!'

        spawn_monster('shark', dialog)

        GameMenu.select('What are you going to do', {
                          "Pull your weapon, Fight": method(:fight_shark),
                          "Jump in the sea and hide": method(:swim_left)
                        })
      end

      def fight_shark
        initiate_combat(5, 25)
        GameMenu.select('You passed the shark, mermaid is giving you an item, What are you going to do', {
                          "Take it ❤️": method(:the_real_beast),
                          "Thank her and move in your way": method(:arrive)
                        })
      end

      def the_real_beast
        Scene.play('lvl01_mermaid_02', 20, { static: true })
        arrive
      end
    end
  end
end
