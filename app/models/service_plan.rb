class ServicePlan < ActiveRecord::Base
  belongs_to :account
  has_many :services
end
