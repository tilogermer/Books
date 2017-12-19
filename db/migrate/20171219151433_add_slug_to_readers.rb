class AddSlugToReaders < ActiveRecord::Migration[5.1]
  def change
    add_column :readers, :slug, :string
  end
end
