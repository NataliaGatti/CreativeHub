class Review < ApplicationRecord
  belongs_to :user
  belongs_to :postulation
  validates :comment, :rating, presence: true
  validates :rating, numericality: true
  validates :rating, :inclusion => 1..5
  validates :user_id, presence: true
end
