class CreateTrims < ActiveRecord::Migration
  def change
    create_table :trims do |t|
      t.string :name
      t.belongs_to :model

      t.timestamps
    end
    add_index :trims, :model_id
  end
end
