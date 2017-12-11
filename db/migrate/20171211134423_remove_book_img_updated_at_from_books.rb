class RemoveBookImgUpdatedAtFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :book_img_updated_at, :datetime
  end
end
