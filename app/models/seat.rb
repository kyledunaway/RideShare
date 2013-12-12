class Seat < ActiveRecord::Base
  attr_accessible :trip_id, :user_id, :pending, :accepted
  belongs_to :trip

  def username
  	User.find(self.user_id).username
  end

  def set_as_accepted
  	self.pending = false
  	self.accepted = true
  end

end
