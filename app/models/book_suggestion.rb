class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, presence: true
  validates :user_id, presence: false
end
