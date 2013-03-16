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
  end
end
