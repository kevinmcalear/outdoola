class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :customer, index: true
      t.references :timeslot, index: true
      t.integer :quantity
      t.integer :cost
      t.string :listing_review

      t.timestamps
    end
  end
end
