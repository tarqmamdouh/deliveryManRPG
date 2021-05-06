class Character < ActiveRecord::Base
    def dead?
        self.hp <= 0
    end

    def heal(amount)
        Scene.play('heal', 0, {},{
            ":heal": amount.to_s,
            ":current": self.hp
            })
        self.hp += amount
    end

    def damage(amount)
        Scene.play('damage', 0, {}, {
            ":damage": amount.to_s,
            ":current": self.hp
            })
        hp -= amount
    end
end