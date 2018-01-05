class AddImageToReaders < ActiveRecord::Migration[5.1]
  def change
    add_column :readers, :image, :string
  end
end
