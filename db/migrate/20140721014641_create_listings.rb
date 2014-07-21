class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :listing_pic_url
      t.text :description
      t.string :timestamps
      t.string :city
      t.string :state
      t.string :address
      t.string :zip
      t.integer :rate
      t.integer :quantity
      t.references :vendor, index: true

      t.timestamps
    end
  end
end
