class Trip < ActiveRecord::Base
  attr_accessible :destination, :origin, :user_id, :username, :markers_attributes, :seat_number

  belongs_to :user

  has_many :markers, :dependent => :destroy
  has_many :seats, :dependent => :destroy
  accepts_nested_attributes_for :markers

after_create :make_markers
  def make_markers
    self.markers.create(:address => self.origin)
    self.markers.create(:address => self.destination)
  	self.save
  end
end