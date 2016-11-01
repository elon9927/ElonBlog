class AddBannerImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :banner_image_url, :string
  end
end
