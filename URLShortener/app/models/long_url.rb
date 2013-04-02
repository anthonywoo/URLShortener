class LongUrl < ActiveRecord::Base
  has_many :short_url
  attr_accessible :url

end