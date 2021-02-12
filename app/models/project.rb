class Project < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :category_projects
  validates :title, :cost, :price, :deadline, :status, presence: true
  validates :description, length: { minimum: 140 }
  enum status: [:open, :closed]
end
