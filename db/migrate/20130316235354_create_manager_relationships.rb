class CreateManagerRelationships < ActiveRecord::Migration
  def change
    create_table :manager_relationships, :id => false  do |t|
      t.integer :site_manager_id
      t.integer :van_manager_id
    end

    add_index :manager_relationships, :site_manager_id
    add_index :manager_relationships, :van_manager_id
    add_index :manager_relationships, [:site_manager_id, :van_manager_id], :unique => true, name: 'mgr_rel'

    #create_table :company_site_manager_relationships, :id => false  do |t|
      #t.integer :site_manager_id
      #t.integer :company_id
    #end
    #add_index :company_site_manager_relationships, :site_manager_id
    #add_index :company_site_manager_relationships, :company_id
    #add_index :company_site_manager_relationships, [:site_manager_id, :company_id], :unique => true, name: 'com_site_mgr_rel'

    #create_table :company_van_manager_relationships, :id => false  do |t|
      #t.integer :company_id
      #t.integer :van_manager_id
    #end
    #add_index :company_van_manager_relationships, :company_id
    #add_index :company_van_manager_relationships, :van_manager_id
    #add_index :company_van_manager_relationships, [:company_id, :van_manager_id], :unique => true, name: 'com_site_mgr_rel'

  end
end
