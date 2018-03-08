class Book < ApplicationRecord
  has_many :rents, dependent: :destroy
  validates :genre, :author, :description, :title, :publisher, :year, presence: true
end
