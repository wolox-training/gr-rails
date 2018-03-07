class RentSerializer < ActiveModel::Serializer
  attributes :user_id, :book_id, :from, :to
end
