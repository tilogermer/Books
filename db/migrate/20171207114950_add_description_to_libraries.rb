class AddDescriptionToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :description, :text
  end
end
