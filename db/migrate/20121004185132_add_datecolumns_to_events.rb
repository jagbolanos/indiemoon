class AddDatecolumnsToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :start_date
    remove_column :events, :end_date
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_index :events, [:start_date, :end_date]
  end
end
