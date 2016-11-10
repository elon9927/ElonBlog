# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base

	belongs_to :post
  #mount_uploader :image, ImageUploader
end
