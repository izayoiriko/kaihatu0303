class Task < ApplicationRecord
  belongs_to :user
  
  validates :work, presence: true, length: { in: 2..10 }
  validates :details, presence: true, length: { in: 2..100 }
  
end
