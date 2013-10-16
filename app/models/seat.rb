class Seat < ActiveRecord::Base
  attr_accessible :trip_id, :username, :user_id

  belongs_to :trip
end
