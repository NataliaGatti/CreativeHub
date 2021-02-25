class Project < ApplicationRecord
  belongs_to :user
  has_many :postulations, dependent: :destroy
  has_many :category_projects, dependent: :destroy
  has_many :categories, through: :category_projects
  validates :title, :cost, :deadline, :status, presence: true
  validates :description, length: { minimum: 50 }
  enum status: [:Abierto, :Cerrado], _default: :Abierto

  scope :open_proyects, -> { where(status: :Abierto) }
  acts_as_punchable
end
