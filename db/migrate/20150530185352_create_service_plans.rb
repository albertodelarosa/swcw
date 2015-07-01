class CreateServicePlans < ActiveRecord::Migration
  def change
    create_table :service_plans do |t|
      t.string      :name,          index: true, null: false, default: ""
      t.string      :status,        index: true, null: false, default: ""
      t.string      :package_type,  index: true, null: false, default: ""
      t.decimal     :price,         index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.string      :vehicle_size,  index: true, null: false, default: ""
      t.belongs_to  :account
      #t.belongs_to :accounts

      t.timestamps null: false
    end
    add_index :service_plans, [:name, :status]
    add_index :service_plans, [:name, :package_type]
    add_index :service_plans, [:name, :price]

    add_index :service_plans, [:status, :package_type]
    add_index :service_plans, [:status, :price]

    add_index :service_plans, [:package_type, :price]
  end
end
