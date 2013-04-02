class Tagging < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :tag
  attr_accessible :tag_id, :short_url_id
end