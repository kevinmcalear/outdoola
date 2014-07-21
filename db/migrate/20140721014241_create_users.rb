class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :phone_number
      t.string :profile_pic_url
      t.text :description
      t.string :timestamps
      t.string :city
      t.string :state
      t.string :address
      t.string :zip
      t.string :type

      t.timestamps
    end
  end
end
