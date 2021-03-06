class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :review
  validates :status, :description, presence: true
  validates :description, length: { minimum: 50 }
  enum status: [:Postulado,:Aceptado, :Declinado], _default: "Postulado"
  has_one_attached :photo
end
