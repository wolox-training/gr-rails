class AddTimestamp < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.timestamps null: false, default: Time.current
    end
  end
end
