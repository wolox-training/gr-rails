class AddCommentsCounterToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comments_counter, :int
  end
end
