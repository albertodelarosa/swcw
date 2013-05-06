class CreateTrims < ActiveRecord::Migration
  def change
    create_table :trims do |t|
      t.string :name

      t.timestamps
    end

    create_table :models_trims, :id => false do |t|
      t.integer :model_id
      t.integer :trim_id
    end

    add_index :models_trims, :model_id
    add_index :models_trims, :trim_id
    #add_index :models_trims, [:model_id, :trim_id], :unique => true
  end
end
