class AddParticipantToMatchFriend < ActiveRecord::Migration[7.1]
  def change
    add_reference :match_friends, :participant, null: false, foreign_key: true
  end
end
