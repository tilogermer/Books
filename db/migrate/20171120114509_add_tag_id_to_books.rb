class AddTagIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :tag_id, :integer
  end
end
