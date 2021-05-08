RSpec.describe Character do
    context "Dies" do
        it "returns true when hp = 0" do
            character = Character.first
            character.hp = 0
            expect(character.dead?).to eq true
        end

        it "returns true when hp < 0" do
            character = Character.first
            character.hp = -10
            expect(character.dead?).to eq true
        end

        it "returns false when hp > 0" do
            character = Character.first
            character.hp = 10
            expect(character.dead?).to eq false
        end
    end

    context "health stats" do
        it "decreases when damaged" do
            character = Character.first
            hp = character.hp
            character.damage(10)
            expect(character.hp).to be < hp
        end

        it "icreases when healed" do
            character = Character.first
            hp = character.hp
            character.heal(10)
            expect(character.hp).to be > hp
        end
    end
end