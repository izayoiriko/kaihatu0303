class Task < ApplicationRecord
  belongs_to :user
  
  validates :work, presence: true, length: { maximum: 20 }
  validates :details, presence: true, length: { maximum: 100 }
  
end
