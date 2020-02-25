class User < ApplicationRecord
 validates :username,uniqueness: true
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

 def email_required?
   false
 end
 def email_changed?
   false
 end
end