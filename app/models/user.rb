class User < ActiveRecord::Base
  validates :email, presence: :true, uniqueness: :true 
  validates :password_digest, presence: :true
  validates :user_name, presence: :true, uniqueness: :true

  has_secure_password
end
