class Task < ApplicationRecord
  belongs_to :user
  
  
  validates :user_id, presence: true
  validates :work, presence: true, length: { in: 2..100 }
  validates :details, presence: true, length: { in: 2..100 }
  
end
