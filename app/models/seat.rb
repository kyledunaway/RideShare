class Seat < ActiveRecord::Base
  attr_accessible :trip_id, :user_id, :pending, :accepted
  belongs_to :trip

  after_create :set_as_pending

  def set_as_pending
  	self.pending = true
  	self.accepted = false
  end
end
