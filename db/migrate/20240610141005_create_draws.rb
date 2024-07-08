# frozen_string_literal: true

class CreateDraws < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :draws do |t|
      t.string :title
      t.string :min_value
      t.string :max_value
      t.datetime :date_draws
      t.datetime :date_present
      t.string :description

      t.timestamps
    end
  end
end
