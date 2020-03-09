class User < ApplicationRecord
 #validates :username,uniqueness: true
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 has_many :books, dependent: :destroy
 attachment :profile_image
 validates :name, presence: true
 validates :name,
    length: { minimum: 2, maximum: 20 }
 validates :introduction,
    length: {maximum: 50 }
end