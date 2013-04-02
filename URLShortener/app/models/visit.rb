class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :short_url
  attr_accessible :short_url_id, :user_id
end
