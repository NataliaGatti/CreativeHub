class Category < ApplicationRecord
  has_many :category_projects
  validates :title, presence: true
  has_one_attached :photo
end