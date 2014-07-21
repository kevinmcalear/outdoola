class ChangeListing < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.references :vendor
     end
  end
end
