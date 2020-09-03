class AddColumnsToFlowerSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :flower_subscriptions, :state, :string
    add_column :flower_subscriptions, :flower_subscription_sku, :string
    add_monetize :flower_subscriptions, :amount, currency: { present: false }
    add_column :flower_subscriptions, :checkout_session_id, :string
  end
end
