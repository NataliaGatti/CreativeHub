class Category < ApplicationRecord
  has_many :category_projects
  validates :title, presence: true
  validates :title, presence: true
end