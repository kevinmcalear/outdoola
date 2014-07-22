class Listing < ActiveRecord::Base
  belongs_to :vendor
  has_many :timeslots

  validates :name, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :address, presence: :true
  validates :zip, presence: :true
  validates :quantity, presence: :true
  validates :rate, presence: :true
  
  validates :vendor_id, presence: :true
end
