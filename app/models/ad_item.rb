class AdItem < ActiveRecord::Base
  belongs_to :ad_banner
  mount_uploader :image, ImageUploader
end
