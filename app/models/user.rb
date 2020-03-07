class User < ApplicationRecord
 #validates :username,uniqueness: true
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 has_many :books
 attachment :profile_image
end