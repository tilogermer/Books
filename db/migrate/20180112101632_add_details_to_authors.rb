class AddDetailsToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :details, :text
  end
end
