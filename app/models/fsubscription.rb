class Fsubscription < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :size, :frequency, :price, presence: true
end
