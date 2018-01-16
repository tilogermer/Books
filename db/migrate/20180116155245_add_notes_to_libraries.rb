class AddNotesToLibraries < ActiveRecord::Migration[5.1]
  def change
    add_column :libraries, :notes, :text
  end
end
