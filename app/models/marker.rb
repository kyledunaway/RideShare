class Marker < ActiveRecord::Base
  attr_accessible :address, :gmaps, :latitude, :longitude, :trip_id
  belongs_to :trip

  acts_as_gmappable
  def gmaps4rails_address
  	address
  end
end