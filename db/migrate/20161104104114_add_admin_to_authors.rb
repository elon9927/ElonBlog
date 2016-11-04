class AddAdminToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :admin, :boolean, default: false
  end
end
