class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :short_urls, :through => :taggings
  attr_accessible :tag
end