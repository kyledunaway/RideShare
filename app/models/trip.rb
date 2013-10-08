class Trip < ActiveRecord::Base
  attr_accessible :destination, :gmaps, :latitude, :longitude, :origin, :user_id, :username



  belongs_to :user
  acts_as_gmappable

  def gmaps4rails_address
  	origin
  end
end
