# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  content    :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
	validates :content, presence: true, length: { minimum: 2 }
  belongs_to :post
  belongs_to :author
end
