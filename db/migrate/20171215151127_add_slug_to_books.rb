class AddSlugToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :slug, :string
  end
end
