class CreateClienteles < ActiveRecord::Migration
  def change
    create_table :clienteles do |t|
      t.belongs_to :site
      t.belongs_to :user

      t.timestamps
    end
    add_index :clienteles, :site_id
    add_index :clienteles, :user_id
  end
end
