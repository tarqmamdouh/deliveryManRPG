class CreateEnvironmentsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :environments do |t|
      t.string :name
      t.text :ascii_model
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
