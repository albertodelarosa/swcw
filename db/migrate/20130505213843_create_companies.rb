class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :corporate_id,                null: false, default: ""
      t.string  :name,                        null: false, default: ""
      t.string  :description,                 null: false, default: ""
      t.string  :corporate_email_domain,      null: false, default: ""
      t.decimal :siteler_dollars_percentage,  null: false, precision: 4, scale: 2, default: 0.0
      t.boolean :remove_cc_info,              null: false, default: false
      t.boolean :user_reg_allowed,            null: false, default: false
      t.boolean :paypal_allowed,              null: false, default: false
      t.boolean :coupons_allowd,              null: false, default: false
      t.boolean :google_checkout_allowed,     null: false, default: false

      t.timestamps
    end
    add_index :companies, :corporate_id
    add_index :companies, :name
    add_index :companies, :description
    add_index :companies, :corporate_email_domain
    add_index :companies, :siteler_dollars_percentage
    add_index :companies, :remove_cc_info
    add_index :companies, :user_reg_allowed
    add_index :companies, :paypal_allowed
    add_index :companies, :coupons_allowd
    add_index :companies, :google_checkout_allowed
  end
end
