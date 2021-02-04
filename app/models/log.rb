class Log < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :log_groups
    has_many :groups, through: :log_groups
    validates :name, presence: true, length: { minimum: 3, maximum: 15 }
    validates_numericality_of :amount, greater_than: 0, allow_nil: false

    has_one_attached :image
    
    def display_image
        image.variant(resize_to_limit: [100, 100])
    end
   
end
