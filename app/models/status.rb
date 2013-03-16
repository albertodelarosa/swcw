class Status < ActiveRecord::Base
  attr_accessible :name

  has_many :role_user
  has_many :appointments

end
