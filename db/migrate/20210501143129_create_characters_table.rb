class CreateCharactersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :ascii_model
      t.boolean :intelligence
      t.integer :hp
      t.integer :armor
      t.integer :speed
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
