class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :email,  null: false, default: ""
      t.string :mobile, null: false, default: ""
      t.string :phone1, null: false, default: ""
      t.string :phone2, null: false, default: ""
      t.string :fax,    null: false, default: ""
      t.string :ext,    null: false, default: ""

      t.string :child_class
      t.string :contactable_type
      t.integer :contactable_id

      t.timestamps
    end
    add_index :contact_infos, :email
    add_index :contact_infos, :mobile
    add_index :contact_infos, :phone1
    add_index :contact_infos, :phone2
    add_index :contact_infos, :fax
    add_index :contact_infos, :ext
  end
end
