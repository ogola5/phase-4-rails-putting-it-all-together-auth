class User < ApplicationRecord
    has_many :recipes
    has_secure_password
    
    validates_uniqueness_of :username
    validates :username, presence: true
end
