class CreateMatchFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :match_friends do |t|
      t.references :draw_user, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
