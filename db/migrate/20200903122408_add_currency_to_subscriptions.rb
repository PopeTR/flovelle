class AddCurrencyToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :flower_subscriptions, :price
    add_monetize :flower_subscriptions, :price, currency: { present: false }
  end
end