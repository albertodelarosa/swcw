FactoryGirl.define do
  factory :order do
    ip_address "MyString"
    first_name "MyString"
    last_name "MyString"
    card_type "MyString"
    card_expires_on "2015-06-08"

    after do |order|
      order.cart_id  ||= FactoryGirl.create(:cart).id
      order.transactions  << FactoryGirl.create(:transaction)
    end
  end

end
