class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table :join_tables do |t|
      t.integer :user_id
      t.integer :memo_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
