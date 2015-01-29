class JoinTable < ActiveRecord::Base

  belongs_to :memo
  belongs_to :event
  # belongs_to :user

end