class Review < ApplicationRecord
  belongs_to :user
  belongs_to :postulation
  validates :comment, :rating, presence: true
  validates :description, length: { minimum: 140 }
  validates :rating, numericality: true
  validates :rating, :inclusion => 1..5
end
