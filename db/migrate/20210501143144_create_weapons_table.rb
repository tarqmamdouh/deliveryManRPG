class CreateWeaponsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.text :ascii_model
      t.integer :damage
      t.boolean :ranged
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
