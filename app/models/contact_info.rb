class ContactInfo < ActiveRecord::Base

  self.inheritance_column = :child_class
  attr_accessible :ext, :fax, :mobile, :phone1, :phone2
  belongs_to :contactable, :polymorphic => true

end
