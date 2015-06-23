class CreateServicePlans < ActiveRecord::Migration
  def change
    create_table :service_plans do |t|
      t.string :name,         index: true, null: false, default: ""
      t.string :status,       index: true, null: false, default: ""
      t.string :type,         index: true, null: false, default: ""
      t.belongs_to :account,  index: true

      t.timestamps null: false
    end
    add_index :service_plans, [:name, :status]
    add_index :service_plans, [:name, :type]

    add_index :service_plans, [:status, :type]

    add_foreign_key :service_plans, :accounts
  end
end
