class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :mobile
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :ext

      t.string :child_class
      t.string :contactable_type
      t.integer :contactable_id

      t.timestamps
    end
  end
end