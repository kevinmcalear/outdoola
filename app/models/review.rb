class Review < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vendor

  validates :title, presence: :true
  validates :score, presence: :true
  
  validates :customer_id, presence: :true
  validates :vendor_id, presence: :true
end
