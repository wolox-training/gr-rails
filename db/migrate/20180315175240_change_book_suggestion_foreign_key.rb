class ChangeBookSuggestionForeignKey< ActiveRecord::Migration[5.1]
  def change
    change_table :book_suggestions do |t|
      change_column :book_suggestions, :user_id, :bigint, :null => true
    end
  end
end
