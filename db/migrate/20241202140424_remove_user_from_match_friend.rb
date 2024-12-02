class RemoveUserFromMatchFriend < ActiveRecord::Migration[7.1]
  def change
    remove_reference :match_friends, :user, null: false, foreign_key: true
  end
end
