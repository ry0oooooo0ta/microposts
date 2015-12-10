class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence:true
  validates :content, presence:true, length: {maximum: 140}
  has_one :thumbnail
  accepts_nested_attributes_for :thumbnail
  mount_uploader :image, ThumbnailUploader

end
