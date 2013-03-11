class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :work1
      t.string :work2
      t.string :fax
      t.string :mobile
      t.string :title
      t.string :salutation

      t.string :child_class
      t.string :addressable_type
      t.integer :addressable_id
      t.timestamps
    end

    add_index :addresses, :addressable_id
  end
end
