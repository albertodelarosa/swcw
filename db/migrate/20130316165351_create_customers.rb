class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_no
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :salutation

      t.timestamps
    end

    create_table :customer_managers_customers, :id => false do |t|
      t.integer :user_id
      t.integer :customer_id
    end

    add_index :customer_managers_customers, :user_id
    add_index :customer_managers_customers, :customer_id
    add_index :customer_managers_customers, [:user_id, :customer_id], :unique => true

  end
end
