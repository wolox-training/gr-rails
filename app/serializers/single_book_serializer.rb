class SingleBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre, :publisher, :year, :img_url
end
