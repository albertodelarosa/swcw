class CreateServicePlans < ActiveRecord::Migration
  def change
    create_table :service_plans do |t|
      t.string      :name,          index: true, null: false, default: ""
      t.string      :status,        index: true, null: false, default: ""
      t.string      :plan_type,     index: true, null: false, default: ""
      t.decimal     :price,         index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.decimal     :price_small,   index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.decimal     :price_large,   index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.string      :vehicle_size,  index: true, null: false, default: ""
      t.string      :image_url,     index: true, null: false, default: ""
      t.belongs_to  :account

      t.timestamps null: false
    end
    add_index :service_plans, [:name, :status]
    add_index :service_plans, [:name, :plan_type]
    add_index :service_plans, [:name, :price]
    add_index :service_plans, [:name, :price_small]
    add_index :service_plans, [:name, :price_large]
    add_index :service_plans, [:name, :image_url]

    add_index :service_plans, [:status, :plan_type]
    add_index :service_plans, [:status, :price]
    add_index :service_plans, [:status, :price_small]
    add_index :service_plans, [:status, :price_large]
    add_index :service_plans, [:status, :image_url]

    add_index :service_plans, [:plan_type, :price]
    add_index :service_plans, [:plan_type, :price_small]
    add_index :service_plans, [:plan_type, :price_large]
    add_index :service_plans, [:plan_type, :image_url]

    add_index :service_plans, [:price, :price_small]
    add_index :service_plans, [:price, :price_large]
    add_index :service_plans, [:price, :image_url]

    add_index :service_plans, [:price_small, :price_large]
    add_index :service_plans, [:price_small, :image_url]

    add_index :service_plans, [:price_large, :image_url]
  end
end
