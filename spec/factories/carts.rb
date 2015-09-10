require 'spec_helper'

FactoryGirl.define do
  factory :cart do
    purchased_at "2015-06-08 13:51:05"
    after do |cart|
      cart.line_items  << FactoryGirl.create(:line_item)
      cart.order      ||= FactoryGirl.create(:order)
    end
  end

end
