class Timeslot < ActiveRecord::Base
  belongs_to :listing
  has_many :bookings

  validates :date, presence: :true
  validates :start_time, presence: :true
  validates :stop_time, presence: :true
  
  validates :listing_id, presence: :true
end
