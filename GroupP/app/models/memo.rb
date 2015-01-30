class Memo < ActiveRecord::Base
  validates_presence_of :name, :content
  has_many :join_tables
  has_many :users, through: :join_table
end
