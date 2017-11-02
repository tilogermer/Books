class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :fname
      t.string :lname
      t.integer :category_id
      t.integer :country_id
      t.text :description

      t.timestamps
    end
  end
end
