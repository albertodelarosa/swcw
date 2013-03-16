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

    create_table :companies_site_managers, :id => false do |t|
      t.integer :company_id
      t.integer :site_manager_id
    end

    create_table :companies_van_managers, :id => false do |t|
      t.integer :company_id
      t.integer :van_managers_id
    end

    add_index :companies_customers, :company_id
    add_index :companies_customers, :customer_id
    add_index :companies_customers, [:company_id, :customer_id], :unique => true

    add_index :companies_site_locations, :company_id
    add_index :companies_site_locations, :site_location_id
    add_index :companies_site_locations, [:company_id, :site_location_id], :unique => true

    add_index :companies_site_managers, :company_id
    add_index :companies_site_managers, :site_manager_id
    add_index :companies_site_managers, [:company_id, :site_manager_id], :unique => true

    add_index :companies_van_managers, :company_id
    add_index :companies_van_managers, :van_managers_id
    add_index :companies_van_managers, [:company_id, :van_managers_id], :unique => true

  end
end
