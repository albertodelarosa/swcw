class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.integer :role_id
      t.integer :user_id
      t.integer :appointment_id

      t.timestamps
    end

    add_index :role_users, :role_id
    add_index :role_users, :user_id
    add_index :role_users, :status_id

  end
end
