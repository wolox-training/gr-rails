require 'httparty'

class OpenLibraryService
  include HTTParty

  def initialize(params)
    @isbn = params[:isbn]
  end

  def book_info
    info = HTTParty.get('https://openlibrary.org/api/books?bibkeys=ISBN:' + @isbn +
                        '&format=json&jscmd=data')
    info = info['ISBN:' + @isbn]
    book = info.slice(:title, :subtitle, :number_of_pages, :authors)
    book[:isbn] = @isbn
    book
  end
end
