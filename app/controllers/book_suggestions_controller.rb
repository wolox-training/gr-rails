class BookSuggestionsController < ApplicationController
  def create
    @book_suggestion = BookSuggestion.create(book_suggestion_creation_params)
    render json: @book_suggestion, serializer: BookSuggestionSerializer, status: :created
  end

  def book_suggestion_creation_params
    params.permit(:editorial, :price, :author, :title, :link, :publisher, :year, :user_id)
  end
end
