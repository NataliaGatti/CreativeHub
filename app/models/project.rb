class Project < ApplicationRecord
  belongs_to :user
  has_many :postulations, dependent: :destroy
  has_many :category_projects
  validates :title, :cost, :deadline, :status, presence: true
  validates :description, length: { minimum: 50 }
  enum status: [:Abierto, :Cerrado]
end
