class ChangeUnreadNotificationsCounterColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :unread_notifications_counter, :unread_notifications_count
  end
end
