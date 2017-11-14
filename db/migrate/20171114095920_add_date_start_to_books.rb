class AddDateStartToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :date_start, :date
  end
end
