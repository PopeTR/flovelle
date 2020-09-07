class AddPhotoToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :photo, :string
  end
end
