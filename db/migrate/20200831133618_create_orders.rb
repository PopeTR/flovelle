class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :feedback
      t.references :supplier, null: false, foreign_key: true
      t.references :fsubscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
