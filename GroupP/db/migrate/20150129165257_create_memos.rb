class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
