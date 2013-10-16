class Trip < ActiveRecord::Base
  attr_accessible :destination, :origin, :user_id, :username, :markers_attributes, :seats_attributes, :seat_number

  belongs_to :user

  has_many :markers
  has_many :seats, :dependent => :destroy
  accepts_nested_attributes_for :markers
  accepts_nested_attributes_for :seats, :reject_if => lambda { |a| a[:username].blank? }, :allow_destroy => true
end