# Class intended to select adventurer
# Adventurer is disposable and will change for every level
module GameModules
  class Adventurer
    attr_reader :character, :weapon

    def initialize
      # Select Hero
      @character = Hero.new.character

      # Select Weapon
      @weapon = CharacterWeapon.new.weapon
    end
  end
end
