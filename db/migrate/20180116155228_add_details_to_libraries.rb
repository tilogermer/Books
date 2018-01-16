class AddDetailsToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :details, :text
  end
end
