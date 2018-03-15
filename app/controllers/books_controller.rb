class BooksController < ApplicationController
  include Wor::Paginate

  def index
    if user_signed_in?
      @books = Book.all
      render_paginated @books, each_serializer: CompleteBookSerializer
    else
      render json: {}, status: 401
    end
  end

  def show
    if user_signed_in?
      @books = Book.find(params[:id])
      render json: @books, serializer: SingleBookSerializer
    else
      render json: {}, status: 401
    end
  end

  def rents
    if user_signed_in?
      @rents = Book.find(params[:id]).rents
      render_paginated @rents, each_serializer: RentSerializer
    else
      render json: {}, status: 401
    end
  end
end
