class Character < ActiveRecord::Base
    def dead?
        self.hp <= 0
    end

    def heal(amount)
        self.hp += amount
        Scene.play('heal', 0, {}, {
            ":heal": amount.to_s,
            ":current": self.hp.to_s
            })
    end

    def damage(amount, message="")
        self.hp -= amount
        Scene.play('damage', 0, {}, {
            ":message": message,
            ":damage": amount.to_s,
            ":current": self.hp.to_s
        })
    end

    def bleed(amount, message="")
        self.hp -= amount
        Scene.play('bleed', 0, {}, {
            ":message": message,
            ":damage": amount.to_s,
            ":current": self.hp.to_s
        })
    end
end