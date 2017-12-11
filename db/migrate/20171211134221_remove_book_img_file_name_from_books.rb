class RemoveBookImgFileNameFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :book_img_file_name, :string
  end
end
