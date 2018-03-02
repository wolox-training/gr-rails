class Book < ApplicationRecord
  has_many :rents
  validates :genre, :author, :image, :title, :publisher, :year, presence: true
end
