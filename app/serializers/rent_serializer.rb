class RentSerializer < ActiveModel::Serializer
  has_one :book, serializer: CompleteBookSerializer
  has_one :user, serializer: UserSerializer
  attributes :id, :from, :to, :returned_at
end
