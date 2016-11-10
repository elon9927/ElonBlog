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
#  image            :string
#

class Post < ActiveRecord::Base
	extend FriendlyId

  attr_accessor :floor
  after_initialize :default_value

  friendly_id :title, use: :slugged

  validates :title, presence: true,
                    length: { minimum: 2 }

  belongs_to :author
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  #has_many :photos, dependent: :destroy

  #accepts_nested_attributes_for :photos

  scope :most_recent, ->{ order(published_at: :desc) }
  scope :published, ->{ where(published: true) }

  before_create :published_at_to_now

  def should_generate_new_friendly_id?
  	title_changed?
  end

  def published_at_to_now
    self.published_at = Time.now
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

  def default_value

     self.floor = 0

  end




  def self.search_by_title(key)
    str = key.strip
    str2 = '%'+str+'%'
    where(["(title like ? or description like ?) and published = ?", str2, str2, true])
    #where('(title like ? or description like ?) and published = ?', "%1%", '%1%', true)
  end


end
