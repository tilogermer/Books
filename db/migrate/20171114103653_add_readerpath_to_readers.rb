class AddReaderpathToReaders < ActiveRecord::Migration[5.1]
  def change
    add_column :readers, :readerpath, :string
  end
end
