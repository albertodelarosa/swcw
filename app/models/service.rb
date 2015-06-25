class Service < ActiveRecord::Base
  belongs_to :service_plan
  serialize :description, Array
end
