class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.belongs_to :company
      t.belongs_to :user

      t.timestamps
    end
    add_index :employments, :company_id
    add_index :employments, :user_id
    add_index :employments, [:company_id, :user_id], :unique => true
  end
end
