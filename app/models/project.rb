class Project < ApplicationRecord
  belongs_to :user
  has_many :postulations, dependent: :destroy
  has_many :favourite_projects, dependent: :destroy
  has_many :category_projects, dependent: :destroy
  has_many :categories, through: :category_projects
  has_many :chatrooms
  validates :title, :cost, :deadline, :status, presence: true

  validates :description, length: { minimum: 50 }
  validate :date_cannot_be_in_the_past
  enum status: [:Abierto, :Cerrado], _default: :Abierto
  has_one_attached :photo

  scope :open_proyects, -> { where(status: :Abierto) }
  acts_as_punchable

  def date_cannot_be_in_the_past
    if deadline.present? && deadline < Date.current
      errors.add(:deadline, "No puede ser anterior a la fecha actual")
    end
  end
end
