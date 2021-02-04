class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 15, minimum: 5 },
                   uniqueness: { case_sensitive: true }
  validates :user_id, presence: true
  has_many :groups, dependent: :destroy
  has_many :log_groups
  has_many :logs, through: :log_groups
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [100, 100])
  end

end
