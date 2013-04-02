class UserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_email
      t.timestamps
    end
  end
end
