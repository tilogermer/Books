class RemoveBookImgFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :book_img, :string
  end
end
