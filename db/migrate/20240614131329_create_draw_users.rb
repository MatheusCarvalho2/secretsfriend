# frozen_string_literal: true

class CreateDrawUsers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :draw_users do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :owner
      t.text :suggestion

      t.timestamps
    end
  end
end
