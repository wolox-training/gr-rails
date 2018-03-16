class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, :user_id, presence: true
end
