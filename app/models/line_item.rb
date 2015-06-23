class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :service_plan

  def full_price
    unit_price * quantity
  end
end
