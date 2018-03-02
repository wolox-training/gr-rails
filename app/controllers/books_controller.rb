class BooksController < ApplicationController
  include Wor::Paginate

  def index
      @books = Book.all
      render_paginated @books
  end
  
  def show
      @books = Book.find(params[:id])
      render json: @books
  end


end
