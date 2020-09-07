class AddSupplierIdToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :flower_subscriptions, :supplier, foreign_key: :true
  end
end
