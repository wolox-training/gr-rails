class BookSuggestionsController < ApplicationController
  def create
    book_suggestion = BookSuggestion.create(book_suggestion_creation_params)
    return render json: book_suggestion, status: :created if book_suggestion.persisted?
    render json: book_suggestion.errors.messages, status: :unprocessable_entity
  end

  def book_suggestion_creation_params
    params.permit(:editorial, :price, :author, :title, :link, :publisher, :year, :user_id)
  end
end
