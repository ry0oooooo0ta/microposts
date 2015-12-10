class Thumbnail < ActiveRecord::Base
  belongs_to :micropost
  mount_uploader :image, ThumbnailUploader
end