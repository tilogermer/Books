class AddSlugToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :slug, :string
  end
end
