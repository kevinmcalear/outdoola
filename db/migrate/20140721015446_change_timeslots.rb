class ChangeTimeslots < ActiveRecord::Migration
  def change
    change_table :timeslots do |t|
      t.change :booked, :boolean, default: false
    end
  end
end
