module GameModules
  class Combat
    def initialize(adventurer, monster, ranged_fight = false)
      @adventurer = adventurer
      @monster = monster
      @ranged_fight = ranged_fight
      prop = probability
      yield(prop)
      if adventurer.character.dead?
        GameMenu.keypress(40)
        Main.game_over
      end
    end

    def probability
      # probability of winning
      prop = 0
      prop += 0.30 unless @adventurer.weapon.ranged && @ranged_fight
      prop += 0.20 if @adventurer.weapon.damage > @monster.armor
      prop += 0.20 if (@adventurer.weapon.attack_speed + @adventurer.character.speed) > @monster.damage * 1.5
      prop
    end
  end
end
