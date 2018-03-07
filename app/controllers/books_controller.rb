class BooksController < ApplicationController
  include Wor::Paginate
  

  def index
    if user_signed_in?
      @books = Book.all
      render_paginated @books, each_serializer: BookSerializer
    else 
        render json: {}, status:  401
    end
  end

  def show
    if user_signed_in?
      @books = Book.find(params[:id])
      render json: @books
    else 
        render json: {}, status:  401
    end
  end
end
