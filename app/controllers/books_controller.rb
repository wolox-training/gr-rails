class BooksController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!
  def index
    @books = Book.all
    render_paginated @books, each_serializer: CompleteBookSerializer
  end

  def show
    @books = Book.find(params[:id])
    render json: @books, serializer: SingleBookSerializer
  end

  def rents
    @rents = Book.find(params[:id]).rents
    render_paginated @rents, each_serializer: RentSerializer
  end
end
