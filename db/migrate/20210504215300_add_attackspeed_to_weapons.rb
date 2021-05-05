class AddAttackspeedToWeapons < ActiveRecord::Migration[6.1]
  def change
    add_column :weapons, :attack_speed, :integer
  end
end
