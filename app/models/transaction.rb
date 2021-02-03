class Transaction < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :transaction_groups
    has_many :groups, through: :transaction_groups
    validates :name, presence: true, length: { minimum: 3, maximum: 15 }
    validates_numericality_of :amount, greater_than: 0, allow_nil: false
end
