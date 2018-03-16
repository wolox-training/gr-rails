class BooksController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!
  def index
    books = Book.all
    OpenLibraryService.new(isbn: '0385472579').book_info
    render_paginated books, each_serializer: CompleteBookSerializer
  end

  def show
    render json: book, serializer: SingleBookSerializer
  end

  def rents
    rents = book.rents
    render_paginated rents, each_serializer: RentSerializer
  end

  def open_library_book
    book_info = OpenLibraryService.new(isbn: params[:isbn]).book_info
    render json: book_info
  end

  def book
    @book ||= Book.find(params[:id])
  end
end
