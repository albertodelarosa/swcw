class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :name
      t.belongs_to :vehicle

      t.timestamps
    end
    add_index :makes, :vehicle_id
  end
end
