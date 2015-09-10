FactoryGirl.define do
  factory :order_transaction do
    action "MyString"
    amount 1
    success false
    authorization "MyString"
    message "MyString"
    params "MyText"

    after do |order_transaction|
      order_transaction.order_id  ||= FactoryGirl.create(:order).id
    end
  end

end
