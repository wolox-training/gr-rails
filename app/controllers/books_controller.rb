class BooksController < ApplicationController
  include Wor::Paginate
  

  def index
    if user_signed_in?
      @books = Book.all
      render_paginated @books
    end
  end

  def show
    if user_signed_in?
      @books = Book.find(params[:id])
      render json: @books
    end
  end
end
