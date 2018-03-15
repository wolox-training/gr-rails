class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :image_url,
             :rents_counter, :comments_counter,
             :unread_notifications_count
end
