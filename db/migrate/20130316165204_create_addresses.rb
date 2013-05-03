class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :suite_no
      t.string :apt_no
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.string :child_class
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
  end
end
