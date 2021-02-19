class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :postulations
  has_many :reviews
  has_one_attached :photo
  validates :rating, inclusion: { in: (1..5), message: "Califique en el rango de 1 a 5." }
end
