class Supplier < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :address, :zipcode, :email, presence: true
end
