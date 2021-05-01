class CreateMonstersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.text :ascii_model
      t.boolean :ranged
      t.integer :hp
      t.integer :armor
      t.integer :damage
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
