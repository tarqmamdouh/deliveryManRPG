class AddeIndexToNames < ActiveRecord::Migration[6.1]
  def change
    add_index :monsters, :name, unique: true
    add_index :environments, :name, unique: true
    add_index :weapons, :name, unique: true
    add_index :characters, :name, unique: true
  end
end
