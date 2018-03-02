class BooksController < ApplicationController
  def index
      @books = Book.all
      render json: @books
  end
  
  def show
      @books = Book.find(params[:id])
  end


end
