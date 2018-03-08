class RenameImageToDescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :image, :description
  end
end
