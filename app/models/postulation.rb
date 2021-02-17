class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :reviews
  validates :file, :status, :description, presence: true
  enum status: [:Postulado,:Aceptado, :Declinado]
end
