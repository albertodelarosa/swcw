class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :vehicle
      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :site
      t.belongs_to :appointment
      t.belongs_to :washing_service
      t.belongs_to :coupon
      t.belongs_to :siteler_dollar

      t.timestamps
    end

    add_index :locations, :appointment_id
    add_index :locations, :company_id
    add_index :locations, :site_id
    add_index :locations, :vehicle_id
    add_index :locations, :user_id
    #add_index :locations, :washing_serviceable_id
    add_index :locations, :coupon_id
    add_index :locations, :siteler_dollar_id

    add_index :locations, [:appointment_id,  :company_id]
    add_index :locations, [:appointment_id,  :site_id]
    add_index :locations, [:appointment_id,  :vehicle_id]
    add_index :locations, [:appointment_id,  :user_id]
    #add_index :locations, [:appointment_id,  :washing_serviceable_id]
    add_index :locations, [:appointment_id,  :coupon_id]
    add_index :locations, [:appointment_id,  :siteler_dollar_id]

    add_index :locations, [:company_id,  :site_id]
    add_index :locations, [:company_id,  :vehicle_id]
    add_index :locations, [:company_id,  :user_id]
    #add_index :locations, [:company_id,  :washing_serviceable_id]
    add_index :locations, [:company_id,  :coupon_id]
    add_index :locations, [:company_id,  :siteler_dollar_id]

    add_index :locations, [:site_id,  :vehicle_id]
    add_index :locations, [:site_id,  :user_id]
    #add_index :locations, [:site_id,  :washing_serviceable_id]
    add_index :locations, [:site_id,  :coupon_id]
    add_index :locations, [:site_id,  :siteler_dollar_id]

    add_index :locations, [:vehicle_id,  :user_id]
    #add_index :locations, [:vehicle_id,  :washing_serviceable_id]
    add_index :locations, [:vehicle_id,  :coupon_id]
    add_index :locations, [:vehicle_id,  :siteler_dollar_id]

    #add_index :locations, [:washing_serviceable_id,  :user_id]
    #add_index :locations, [:washing_serviceable_id,  :coupon_id]
    #add_index :locations, [:washing_serviceable_id,  :siteler_dollar_id]

    add_index :locations, [:coupon_id,  :user_id]
    add_index :locations, [:coupon_id,  :siteler_dollar_id]

    add_index :locations, [:siteler_dollar_id,  :user_id]
  end
end
