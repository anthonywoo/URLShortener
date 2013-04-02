class AddLongUrlTable < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :url
      t.timestamp
    end
  end
end
