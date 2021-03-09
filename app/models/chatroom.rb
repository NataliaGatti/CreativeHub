class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :designer, class_name: "User"
  belongs_to :company, class_name: "User"
end
