class Project < ApplicationRecord
  belongs_to :user
  has_many :postulations
  has_many :category_projects
  validates :title, :cost, :deadline, :status, presence: true
  validates :description, length: { minimum: 50 }
  enum status: [:open, :closed]
end
