class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1,  null: false, default: ""
      t.string :suite_no, null: false, default: ""
      t.string :apt_no,   null: false, default: ""
      t.string :street2,  null: false, default: ""
      t.string :city,     null: false, default: ""
      t.string :state,    null: false, default: ""
      t.string :zip,      null: false, default: ""

      t.string :child_class
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
    add_index :addresses, :street1
    add_index :addresses, :suite_no
    add_index :addresses, :apt_no
    add_index :addresses, :street2
    add_index :addresses, :city
    add_index :addresses, :state
    add_index :addresses, :zip
  end
end
