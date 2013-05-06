class CreateTransportations < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.belongs_to :user
      t.belongs_to :vehicle

      t.timestamps
    end
    add_index :transportations, :user_id
    add_index :transportations, :vehicle_id
    add_index :transportations, [:user_id, :vehicle_id], :unique => true
  end
end
