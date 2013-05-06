class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_id
      t.string :name
      t.string :description
      t.string :corporate_email_domain
      t.decimal :siteler_dollars_percentage
      t.boolean :remove_cc_info
      t.boolean :user_reg_allowed
      t.boolean :paypal_allowed
      t.boolean :coupons_allowd
      t.boolean :google_checkout_allowed

      t.timestamps
    end
  end
end
