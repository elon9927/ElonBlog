# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true,
                    length: { minimum: 2 }

  belongs_to :author
  has_many :comments, dependent: :destroy
  scope :most_recent, ->{ order(published_at: :desc) }
  scope :published, ->{ where(published: true) }

  def should_generate_new_friendly_id?
  	title_changed?
  end

  def display_day_published
  	"Published #{published_at.strftime('%-b %-d, %Y')}"
  end

  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: Time.now)
  end
end
