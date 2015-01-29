class Memo < ActiveRecord::Base
  has_many :join_tables
  has_many :users, through: :join_table
end
