class User < ApplicationRecord
    before_save { username.downcase! }
    validates_uniqueness_of :name
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    has_many :groups
    has_many :transactions
end
