class Order < ApplicationRecord
  belongs_to :supplier
  belongs_to :fsubscription
end
