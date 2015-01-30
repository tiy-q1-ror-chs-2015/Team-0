class AddColumnToMemo < ActiveRecord::Migration
  def change
    add_column :memos, :user_id, :integer
    remove_column :join_tables, :memo_id
  end
end
