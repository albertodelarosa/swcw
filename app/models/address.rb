class Address < ActiveRecord::Base

  self.inheritance_column = :child_class
  attr_accessible :city, :state, :street1, :street2, :zip
  belongs_to :addressable, :polymorphic => true

  def print
    print " Class Type: "
    puts self.class || "N/A"
    print " Street1: "
    puts self.street1 || "N/A"
    print " Street2: "
    puts self.street2 || "N/A"
    print "    City: "
    puts self.city || "N/A"
    print "   State: "
    puts self.state || "N/A"
    print "     Zip: "
    puts self.zip || "N/A"
  end
end
