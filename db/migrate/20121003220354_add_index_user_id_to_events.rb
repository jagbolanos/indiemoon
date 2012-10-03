class AddIndexUserIdToEvents < ActiveRecord::Migration
  def change
    add_index :events, [:user_id, :created_at]
  end
end
