class ChangeListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.remove_references(:vendor)
      t.references :user
     end
  end
end
