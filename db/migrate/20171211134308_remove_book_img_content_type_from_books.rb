class RemoveBookImgContentTypeFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :book_img_content_type, :string
  end
end
