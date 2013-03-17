class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_no
      t.string :business_id
      t.string :name

      t.timestamps
    end
    create_table :companies_customers, :id => false do |t|
      t.integer :company_id
      t.integer :customer_id
    end

    create_table :companies_site_locations, :id => false do |t|
      t.integer :company_id
      t.integer :site_location_id
    end

    add_index :companies_customers, :company_id
    add_index :companies_customers, :customer_id
    add_index :companies_customers, [:company_id, :customer_id], :unique => true, :name => 'cos_custs'

    add_index :companies_site_locations, :company_id
    add_index :companies_site_locations, :site_location_id
    add_index :companies_site_locations, [:company_id, :site_location_id], :unique => true, :name => 'cos_site_locs'

  end
end
