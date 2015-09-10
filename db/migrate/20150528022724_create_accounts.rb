class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :account_number,    index: true, null: false, default: ""
      t.string  :status,            index: true, null: false, default: "new"
      t.decimal :sd_percent,        index: true, null: false, default: 0.0,   precision: 4, scale: 2
      t.boolean :remove_cc_info,    index: true, null: false, default: false
      t.boolean :regular_allowed,   index: true, null: false, default: false
      t.boolean :paypal_allowed,    index: true, null: false, default: false
      t.boolean :google_allowed,    index: true, null: false, default: false
      t.boolean :apple_pay_allowed, index: true, null: false, default: false
      t.boolean :coupons_allowed,   index: true, null: false, default: false

      t.belongs_to :user,           index: true

      t.timestamps null: false
    end
    add_index :accounts, [:account_number, :status]
    add_index :accounts, [:account_number, :sd_percent]
    add_index :accounts, [:account_number, :remove_cc_info]
    add_index :accounts, [:account_number, :regular_allowed]
    add_index :accounts, [:account_number, :paypal_allowed]
    add_index :accounts, [:account_number, :google_allowed]
    add_index :accounts, [:account_number, :apple_pay_allowed]
    add_index :accounts, [:account_number, :coupons_allowed]

    add_index :accounts, [:status, :sd_percent]
    add_index :accounts, [:status, :remove_cc_info]
    add_index :accounts, [:status, :regular_allowed]
    add_index :accounts, [:status, :paypal_allowed]
    add_index :accounts, [:status, :google_allowed]
    add_index :accounts, [:status, :apple_pay_allowed]
    add_index :accounts, [:status, :coupons_allowed]

    add_index :accounts, [:sd_percent, :remove_cc_info]
    add_index :accounts, [:sd_percent, :regular_allowed]
    add_index :accounts, [:sd_percent, :paypal_allowed]
    add_index :accounts, [:sd_percent, :google_allowed]
    add_index :accounts, [:sd_percent, :apple_pay_allowed]
    add_index :accounts, [:sd_percent, :coupons_allowed]

    add_index :accounts, [:remove_cc_info, :regular_allowed]
    add_index :accounts, [:remove_cc_info, :paypal_allowed]
    add_index :accounts, [:remove_cc_info, :google_allowed]
    add_index :accounts, [:remove_cc_info, :apple_pay_allowed]
    add_index :accounts, [:remove_cc_info, :coupons_allowed]

    add_index :accounts, [:regular_allowed, :paypal_allowed]
    add_index :accounts, [:regular_allowed, :google_allowed]
    add_index :accounts, [:regular_allowed, :apple_pay_allowed]
    add_index :accounts, [:regular_allowed, :coupons_allowed]

    add_index :accounts, [:paypal_allowed, :google_allowed]
    add_index :accounts, [:paypal_allowed, :apple_pay_allowed]
    add_index :accounts, [:paypal_allowed, :coupons_allowed]

    add_index :accounts, [:google_allowed, :apple_pay_allowed]
    add_index :accounts, [:google_allowed, :coupons_allowed]

    add_index :accounts, [:apple_pay_allowed, :coupons_allowed]

    add_foreign_key :accounts, :users
  end
end
