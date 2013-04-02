#!/usr/bin/ruby
require 'launchy'

puts "Please enter your username:"
username = gets.chomp
puts "Please enter your email:"
email = gets.chomp
@logged_user = User.login(username, email)
input = nil

def create_url
  puts "Enter URL:"
  url = gets.chomp
  short_url = @logged_user.create_url_entry(url)
  puts "#{url} shortened to #{short_url.short_url}."
  puts "Add tags or return to skip"
  tag_input = gets.chomp
  unless tag_input == ''
    tag_input.split(' ').each do |tag|
      @logged_user.add_tags(short_url.id, tag)
    end
  end
  puts "Add comment or return to skip"
  comment_input = gets.chomp
  unless comment_input == ''
    @logged_user.create_comment(short_url, comment_input)
  end
end

def launch_url
  puts @logged_user.all_links
  puts "Which Short URL do you want to open?"
  url = gets.chomp
  suobject = ShortUrl.find_by_short_url(url)
  Launchy.open(suobject.long_url.url)
  @logged_user.visit(suobject)
end

def find_by_tag
  puts "Which tag would you like to search for?"
  tag = gets.chomp
  tag_object = Tag.find_by_tag(tag)
  p tag_object.short_urls.map { |url| url.short_url }
end

def show_top_link


end

until input == 'quit'
  puts "What would you like to do?"
  puts "1. Shorten a URL"
  puts "2. Visit a shortened URL"
  puts "3. Search for URL by tag"
  puts "4. Show top links"
  input = gets.chomp
  case input
  when "1" then create_url
  when "2" then launch_url
  when "3" then find_by_tag
  when "4" then show_top_link
  end
end
