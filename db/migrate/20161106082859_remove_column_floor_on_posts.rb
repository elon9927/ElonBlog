class RemoveColumnFloorOnPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :floor 
  end

  def down
    add_column :posts, :floor, :integer
  end
end
