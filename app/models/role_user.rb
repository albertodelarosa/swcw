class RoleUser < ActiveRecord::Base
  attr_accessible :appointment, :role, :user

  belongs_to :user
  belongs_to :role
  belongs_to :appointment

end
