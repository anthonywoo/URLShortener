class CreateCommentTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :short_url_id
      t.text :comment
      t.timestamp
    end
  end
end
