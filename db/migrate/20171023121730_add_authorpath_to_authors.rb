class AddAuthorpathToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :authorpath, :string
  end
end
