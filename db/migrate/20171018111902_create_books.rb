class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :book_img
      t.integer :category_id
      t.integer :author_id
      t.integer :library_id
      t.integer :media_id
      t.string :year
      t.float :price
      t.boolean :isFavorite
      t.boolean :isNew
      t.boolean :isReturned
      t.date :return_date

      t.timestamps
    end
  end
end
