class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username,   index: true, null: false, default: "", unique: true
      t.string :first_name, index: true, null: false, default: ""
      t.string :last_name,  index: true, null: false, default: ""
      t.string :salutation, index: true, null: false, default: ""
      t.string :suffix,     index: true, null: false, default: ""
      t.string :name,       index: true, null: false, default: ""
      t.string :image_url,  index: true, null: false, default: ""
      t.string :urls,       index: true, null: false, default: ""

      ## Omniauthable
      t.string :provider, null: false, default: ""
      t.string :uid,      null: false, default: ""

      ## Database authenticatable
      t.string :email, index: true, null: false, default: "", unique: true
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token, index: true, unique: true
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token, index: true, unique: true
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token,    index: true, unique: true # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Token authenticatable
      t.string :authentication_token, index: true, unique: true

      t.timestamps
    end

  end
end
