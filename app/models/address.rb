class Address < ActiveRecord::Base

  self.inheritance_column = :child_class
  attr_accessible :city, :state, :street1, :street2, :zip
  belongs_to :addressable, :polymorphic => true

end
