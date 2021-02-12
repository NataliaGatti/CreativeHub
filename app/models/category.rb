class Category < ApplicationRecord
  has_many :category_projects
  validates :title, presence: true
  validates :title, inclusion: { in: ["diseño gráfico",  "fotografía", "video", "ilustración", "diseño ux/ui responsive"),
    message: "%{value} no es una categoria valida" }
end