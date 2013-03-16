class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :work1
      t.string :work2
      t.string :fax
      t.string :mobile

      t.timestamps
    end
  end
end
