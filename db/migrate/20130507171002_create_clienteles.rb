class CreateClienteles < ActiveRecord::Migration
  def change
    create_table :clienteles do |t|
      t.belongs_to :company
      t.belongs_to :user

      t.timestamps
    end
    add_index :clienteles, :company_id
    add_index :clienteles, :user_id
  end
end
