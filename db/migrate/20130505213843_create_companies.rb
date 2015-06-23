class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :corp_id,         index: true, null: false, default: ""
      t.string  :name,            index: true, null: false, default: ""
      t.string  :description,     index: true, null: false, default: ""
      t.string  :corp_email,      index: true, null: false, default: ""

      t.timestamps
    end
    add_index :companies, [:corp_id, :name]
    add_index :companies, [:corp_id, :description]
    add_index :companies, [:corp_id, :corp_email]

    add_index :companies, [:name, :description]
    add_index :companies, [:name, :corp_email]

    add_index :companies, [:description, :corp_email]
  end
end
