class Memo < ActiveRecord::Base
  validates_presence_of :name, :content
  belongs_to :user
end