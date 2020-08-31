class Supplier < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :name, :address, :zipcode, :email, presence: true
end
