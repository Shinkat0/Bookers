class User < ApplicationRecord
 #validates :username,uniqueness: true
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 has_many :books, dependent: :destroy
 attachment :profile_image
 validates :name,
    length: { minimum: 2, maximum: 20 }
 validates :Introduction,
    length: {maximum: 50 }
end