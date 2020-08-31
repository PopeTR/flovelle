class CreateFsubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :fsubscriptions do |t|
      t.string :size
      t.integer :frequency
      t.integer :price
      t.string :preferences
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
