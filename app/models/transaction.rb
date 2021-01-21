class Transaction < ApplicationRecord
    belongs_to :user
    has_many :groups, :through => :group_transactions
    validates :name, presence: true, length: { minimum: 3, maximun: 25 }
    validates_numericality_of :amount, greater_than: 0, allow_nil: true
end
