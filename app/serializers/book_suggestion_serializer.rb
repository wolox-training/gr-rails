class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :editorial, :price, :author, :title, :link, :publisher, :year
end
