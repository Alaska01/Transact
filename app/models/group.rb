class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 15, minimum: 5 },
                   uniqueness: { case_sensitive: true }
  validates :user_id, presence: true
  has_many :groups, dependent: :destroy

end
