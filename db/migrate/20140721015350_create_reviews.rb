class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :customer, index: true
      t.references :vendor, index: true
      t.string :title
      t.integer :score
      t.text :review

      t.timestamps
    end
  end
end
