class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :date
      t.string :start_time
      t.string :stop_time
      t.boolean :booked
      t.references :listing, index: true

      t.timestamps
    end
  end
end
