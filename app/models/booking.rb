class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :timeslot

  validates :quantity, presence: :true
  validates :cost, presence: :true
  
  validates :customer_id, presence: :true
  validates :timeslot_id, presence: :true
end
