class AddImgUrlRentsCounterUnreadNotificationsCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image_url, :string
    add_column :users, :rents_counter, :int
    add_column :users, :unread_notifications_counter, :int
  end
end
