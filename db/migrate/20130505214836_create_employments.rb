class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :company_id
      t.integer :user_id
    end
  end
end
