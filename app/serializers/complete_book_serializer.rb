class CompleteBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :img_url, :publisher,
             :year, :genre, :created_at, :updated_at
end
