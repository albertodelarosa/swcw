class Company < ActiveRecord::Base
  attr_accessible :business_id, :company_no, :name

  has_and_belongs_to_many :customers
  has_and_belongs_to_many :site_locations
  has_and_belongs_to_many :site_managers
  has_and_belongs_to_many :van_managers

end
