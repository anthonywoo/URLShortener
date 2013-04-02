class AddTimeStampToVisits < ActiveRecord::Migration
  def up # Or `def up` in 3.1
    change_table :visits do |t|
      t.timestamps
    end
  end

  def down # Or `def down` in 3.1
    remove_column :visits, :created_at
    remove_column :visits, :updated_at
  end

end
