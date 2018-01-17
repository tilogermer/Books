class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.date :date_start
      t.date :date_end
      t.integer :book_id
      t.integer :library_id
      t.integer :reader_id
      t.boolean :is_returned

      t.timestamps
    end
  end
end
