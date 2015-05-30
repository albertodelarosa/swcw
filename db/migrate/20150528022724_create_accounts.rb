class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number, null: false, default: ""
      t.string :status, null: false, default: ""
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_index :accounts, :account_number
    add_index :accounts, :status
    add_foreign_key :accounts, :users
  end
end
