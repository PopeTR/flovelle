class Supplier < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :address, :email, presence: true
end
