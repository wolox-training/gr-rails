class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, presence: true
  has_one :user, dependent: :nullify
end
