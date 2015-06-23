class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :email,  null: false, default: "", index: true
      t.string :mobile, null: false, default: "", index: true
      t.string :phone1, null: false, default: "", index: true
      t.string :phone2, null: false, default: "", index: true
      t.string :ext,    null: false, default: "", index: true
      t.string :fax,    null: false, default: "", index: true

      t.string :child_class
      t.string :contactable_type
      t.integer :contactable_id

      t.timestamps
    end
    add_index :contact_infos, [:email, :mobile]
    add_index :contact_infos, [:email, :phone1]
    add_index :contact_infos, [:email, :phone2]
    add_index :contact_infos, [:email, :ext]
    add_index :contact_infos, [:email, :fax]

    add_index :contact_infos, [:mobile, :phone1]
    add_index :contact_infos, [:mobile, :phone2]
    add_index :contact_infos, [:mobile, :ext]
    add_index :contact_infos, [:mobile, :fax]

    add_index :contact_infos, [:phone1, :phone2]
    add_index :contact_infos, [:phone1, :ext]
    add_index :contact_infos, [:phone1, :fax]

    add_index :contact_infos, [:phone2, :ext]
    add_index :contact_infos, [:phone2, :fax]

    add_index :contact_infos, [:ext, :fax]
  end
end
