class AddWorkToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :work, :text
  end
end
