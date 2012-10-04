class AddDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :startdate, :datetime
    add_column :events, :description, :string
    add_column :events, :address, :string
    add_index :events, :startdate
  end
end
