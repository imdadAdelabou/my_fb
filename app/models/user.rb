class User < ApplicationRecord
    has_many :Posts
    validates :name, presence: true, length: {maximum: 30}
    validates :surname, presence: true, length: {maximum: 30}
    validates :email, presence: true, length: {maximum: 255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
    before_validation { email.downcase! }
    has_secure_password
    validates :password, length: {minimum: 6}
end
