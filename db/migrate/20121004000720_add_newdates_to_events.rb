class AddNewdatesToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :startdate
    remove_column :events, :enddate
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
    add_index :events, [:start_date, :end_date]
  end
end
