class AddDescriptionToReaders < ActiveRecord::Migration[5.1]
  def change
    add_column :readers, :description, :text
  end
end
