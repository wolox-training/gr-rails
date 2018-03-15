class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, :book_id, :from, :to, :returned_at, presence: true
end
