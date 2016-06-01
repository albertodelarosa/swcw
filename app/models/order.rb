class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :transactions, class_name: "OrderTransaction"

  attr_accessor :card_number, :card_verification, :card_expires_on_month, :card_expires_on_year

  validate :validate_card, on: :create

  def purchase
    response = QB_GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(action: "purchase", amount: price_in_cents, response: response)
    cart.update_attribute(:purchased_at, Time.now) if 1==1
    return true
  end


  #def purchase
    #response = QB_GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    #transactions.create!(action: "purchase", amount: price_in_cents, response: response)
    #cart.update_attribute(:purchased_at, Time.now) if response.success?
    #response.success?
  #end

  def price_in_cents
    (cart.total_price*100).round
  end

  private

  def purchase_options
    {
      ip: ip_address,
      billing_address: {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def validate_card
    return true
    #unless credit_card.valid?
      #credit_card.errors.full_messages.each do |message|
        #errors[:base] << message
      #end
    #end
  end

  def credit_card
    @credit_card = {
      :brand              => :card_type,
      :number             => :card_number,
      :verification_value => :card_verification,
      :month              => :card_expires_on,
      :year               => :card_expires_on,
      :first_name         => :first_name,
      :last_name          => :last_name
    }
  end
end
