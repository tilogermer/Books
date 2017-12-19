class AddSlugToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :slug, :string
  end
end
