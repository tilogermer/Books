class RemoveMediaIdFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :media_id, :integer
  end
end
