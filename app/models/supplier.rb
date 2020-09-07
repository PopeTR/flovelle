class Supplier < ApplicationRecord
  belongs_to :user
  has_many :flower_subscriptions, dependent: :destroy
  validates :name, :address, :zipcode, :email, presence: true

  def orders_for
    orders = 0
    flower_subscriptions.each do |subscription|
      if subscription.frequency == 4
        orders += 1
      elsif subscription.frequency == 2
        first_delivery_week = subscription.delivery_date.strftime("%U").to_i
        current_delivery_week = Date.new().strftime("%U").to_i
        orders += 1 if (current_delivery_week - first_delivery_week).even?
      elsif subscription.frequency == 1
        first_delivery_week = subscription.delivery_date.strftime("%U").to_i
        current_delivery_week = Date.new().strftime("%U").to_i
        orders += 1 if current_delivery_week - first_delivery_week == 4
      end
    end
    orders
  end
end
