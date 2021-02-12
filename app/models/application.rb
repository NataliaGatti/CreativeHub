class Application < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :reviews
  validates :file, :status, presence: true
  enum status: [:accepted, :declined]
end
