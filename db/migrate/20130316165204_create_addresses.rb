class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1,  null: false, default: "", index: true
      t.string :suite_no, null: false, default: "", index: true
      t.string :apt_no,   null: false, default: "", index: true
      t.string :street2,  null: false, default: "", index: true
      t.string :city,     null: false, default: "", index: true
      t.string :state,    null: false, default: "", index: true
      t.string :zip,      null: false, default: "", index: true

      t.string :child_class
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
    add_index :addresses, [:street1, :suite_no]
    add_index :addresses, [:street1, :apt_no]
    add_index :addresses, [:street1, :street2]
    add_index :addresses, [:street1, :city]
    add_index :addresses, [:street1, :state]
    add_index :addresses, [:street1, :zip]

    add_index :addresses, [:suite_no, :apt_no]
    add_index :addresses, [:suite_no, :street2]
    add_index :addresses, [:suite_no, :city]
    add_index :addresses, [:suite_no, :state]
    add_index :addresses, [:suite_no, :zip]

    add_index :addresses, [:apt_no, :street2]
    add_index :addresses, [:apt_no, :city]
    add_index :addresses, [:apt_no, :state]
    add_index :addresses, [:apt_no, :zip]

    add_index :addresses, [:street2, :city]
    add_index :addresses, [:street2, :state]
    add_index :addresses, [:street2, :zip]

    add_index :addresses, [:city, :state]
    add_index :addresses, [:city, :zip]

    add_index :addresses, [:state, :zip]
  end
end
