class AddDrawToMatchFriend < ActiveRecord::Migration[7.1]
  def change
    add_reference :match_friends, :draw, null: false, foreign_key: true
  end
end
