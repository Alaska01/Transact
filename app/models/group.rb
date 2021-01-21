class Group < ApplicationRecord
    belongs_to :user
    has_many :transactions, :through => :group_transactions
    validates :name, presence: true
end
