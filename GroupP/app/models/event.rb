class Event < ActiveRecord::Base
  validates_presence_of :name, :date, :description
  has_many :join_tables
  has_many :users, through: :join_tables
end