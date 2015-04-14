class Page < ActiveRecord::Base
  #attr_accessible :parent_id, :content, :name
  has_ancestry
  belongs_to :ad_banner
  has_many :newsfeeds
end
