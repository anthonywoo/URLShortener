# require 'launchy'

class User < ActiveRecord::Base
  attr_accessible :user_name, :user_email
  has_many :comments
  has_many :short_urls
  validates :user_name, :uniqueness => true

  def self.login(name, email)
    if User.find_by_user_name(name).nil?
      User.create(:user_name => name, :user_email => email)
    end
    User.find_by_user_name(name)
  end

  def create_url_entry(url)
    LongUrl.create(:url => url) if (LongUrl.find_by_url(url)).nil?
    long_url_id = (LongUrl.find_by_url(url).id)
    ShortUrl.create(:user_id => self.id, :short_url => create_short_url,
                    :long_url_id => long_url_id)
  end

  def visit(short_url)
    Visit.create(:user_id => self.id, :short_url_id => short_url.id)
  end

  def create_short_url
    SecureRandom.urlsafe_base64[0..4]
  end

  def create_comment(link, body)
    Comment.create(:user_id => self.id, :short_url_id => link.id, :comment => body)
  end

  def add_tags(short_url_id, *tags)
    tags.each do |tag|
      Tag.create(:tag => tag) if (Tag.find_by_tag(tag)).nil?
      tag_id = (Tag.find_by_tag(tag).id)
      Tagging.create(:tag_id => tag_id, :short_url_id => short_url_id)
    end
  end

  def all_links
    ShortUrl.where(:user_id => self.id).each do |url|
      puts "Short URL:#{url.short_url}. Comment: #{url.comments[0].comment}. Tags: #{url.tags.map{|x| x.tag}}"
    end
    puts ""
  end

end
