require 'httparty'

class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'
  def initialize(params)
    @isbn = params[:isbn]
  end

  def book_info
    response = OpenLibraryService.get('/api/books', query: { bibkeys: 'ISBN:' + @isbn,
                                                             format: 'json', jscmd: 'data' })
    if response.nil?
      response
    else
      response['ISBN:' + @isbn].slice('title', 'subtitle', 'number_of_pages', 'authors')
    end
  end
end
