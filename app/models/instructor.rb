class Instructor < ApplicationRecord
  has_many :students, dependent: :nullify
  
  validates :name, presence: true
end
