class AddUserToDraw < ActiveRecord::Migration[7.1]
  def change
    add_reference :draws, :user, null: false, foreign_key: true
  end
end
