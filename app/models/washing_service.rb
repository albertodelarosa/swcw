class WashingService < ActiveRecord::Base
  self.inheritance_column = :child_class
  belongs_to :washing_serviceable, :polymorphic => true
end
