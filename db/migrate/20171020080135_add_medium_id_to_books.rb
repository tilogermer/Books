class AddMediumIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :medium_id, :integer
  end
end
