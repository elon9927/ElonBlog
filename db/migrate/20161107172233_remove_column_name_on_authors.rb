class RemoveColumnNameOnAuthors < ActiveRecord::Migration
  def up
    remove_column :authors, :name
  end

  def down
    add_column :authors, :name, :string
  end
end
