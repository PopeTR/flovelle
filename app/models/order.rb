class Order < ApplicationRecord
  belongs_to :supplier
  belongs_to :flower_subscription
  monetize :amount_cents
end
