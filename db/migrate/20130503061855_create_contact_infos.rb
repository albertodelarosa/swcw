class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :ext

      t.string :child_class
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
  end
end
