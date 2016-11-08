class AddNameToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :name, :string
    add_index :authors, :name, unique: true
  end
end
