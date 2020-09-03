class FlowerSubscription < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  monetize :price_cents
  validates :size, :frequency, :price, presence: true

  def start_time
    self.delivery_date
  end

end
