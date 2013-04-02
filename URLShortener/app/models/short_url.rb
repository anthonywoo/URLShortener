class ShortUrl < ActiveRecord::Base
  belongs_to :user
  belongs_to :long_url
  has_many :comments
  has_many :tags, :through => :taggings
  has_many :taggings
  attr_accessible :short_url, :long_url_id, :user_id, :tags

  def count_visits
    Visit.where(:short_url_id => self.id).count
  end

  def count_unique_visitors
    Visit.select(:user_id).where(:short_url_id => self.id).uniq.length
  end

  def visits_last_ten
    Visit.where(:short_url_id => self.id).where(
                "created_at > ?", Time.now-600).length
  end

  def most_popular
    Visit.select("short_url_id, COUNT(*) count").group('short_url_id').order('count DESC')

  end
end