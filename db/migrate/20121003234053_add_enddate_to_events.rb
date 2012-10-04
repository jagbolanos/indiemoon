class AddEnddateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :enddate, :datetime
    add_index :events, :enddate
  end
end
