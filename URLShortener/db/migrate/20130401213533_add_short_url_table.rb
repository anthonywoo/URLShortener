class AddShortUrlTable < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.integer :user_id
      t.integer :long_url_id
      t.string :short_url
      t.timestamp
    end
  end

end
