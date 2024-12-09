class CreateMatchFriend < ActiveRecord::Migration[7.1]
  def change
    create_table :match_friends do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :participant1, null: false, foreign_key: { to_table: :participants }
      t.references :participant2, null: false, foreign_key: { to_table: :participants }

      t.timestamps
    end
  end
end
