class User < ApplicationRecord
    has_secure_password
    has_many :platforms
    has_many :reviews
    has_many :games, through: :reviews
    has_many :games, through: :platforms
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 7, message:"Please make sure your password is atleast 7 characters long."}
 
end