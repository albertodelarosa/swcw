class CreateServicePlans < ActiveRecord::Migration
  def change
    create_table :service_plans do |t|
      t.string :name, null: false, default: ""
      t.string :type, null: false, default: ""
      t.belongs_to :account, index: true

      t.timestamps null: false
    end
    add_index :service_plans, :name
    add_index :service_plans, :type
    add_foreign_key :service_plans, :accounts
  end
end
