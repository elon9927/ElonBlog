class AddFloorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :floor, :integer, default: 0
  end
end
