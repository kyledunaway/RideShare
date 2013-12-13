class Trip < ActiveRecord::Base
  attr_accessible :destination, :origin, :user_id, :username, :markers_attributes, :seat_number, :price, :start_date, :comments

  belongs_to :user

  validates_presence_of :destination, :origin, :seat_number, :price, :start_date

  has_many :markers, :dependent => :destroy
  has_many :seats, :dependent => :destroy
  accepts_nested_attributes_for :markers

after_create :make_markers
  def make_markers
    self.markers.create(:address => self.origin)
    self.markers.create(:address => self.destination)
  	self.save
  end

  def seat_pending_count
    p = 0
      self.seats.each do |t|
        if t.pending == true
          p += 1
        else
        end
      end
    return p
  end

  def seat_accepted_count
    a = 0
      self.seats.each do |t|
        if t.accepted == true
          a += 1
        else
        end
      end
    return a
  end
end