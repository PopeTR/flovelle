class FlowerSubscription < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  monetize :price_cents
  validates :size, :frequency, :price_cents, presence: true
  before_update :price_check

  def start_time
    self.delivery_date
  end

  def price_check
  	if self.size_changed?
	    # @flower_subscription = FormatSubscriptionService.new(flower_subscription: @flower_subscription).call
	        # storing size of bouquet
      if self.size == "Small"
        self.price_cents = 2500
      elsif self.size == "Medium"
        self.price_cents = 4000
      else self.size == "Large"
        self.price_cents = 5500
      end
	    
	end  	
  end

end
