# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :participants do |t|
      t.string :name, null: true
      t.string :email, null: false
      t.references :draw, null: false, foreign_key: true

      t.timestamps
    end
  end
end
