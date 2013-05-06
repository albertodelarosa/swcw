class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :size
      t.belongs_to :make

      t.timestamps
    end
    add_index :models, :make_id
  end
end
