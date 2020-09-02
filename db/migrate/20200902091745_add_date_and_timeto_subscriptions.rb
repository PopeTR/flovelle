class AddDateAndTimetoSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :flower_subscriptions, :delivery_date, :datetime
    add_column :flower_subscriptions, :delivery_day, :string
    add_column :flower_subscriptions, :time_of_day, :string
  end
end
