class CreateTagTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag
      t.timestamp
    end
  end
end
