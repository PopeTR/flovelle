class FlowerSubscription < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :size, :frequency, :price, presence: true
end
