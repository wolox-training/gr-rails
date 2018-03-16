class AddConfirmationSentAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmation_sent_at, :string
    add_column :users, :string, :string
  end
end
