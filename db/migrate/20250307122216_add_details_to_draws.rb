# frozen_string_literal: true

class AddDetailsToDraws < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_column :draws, :location, :string
    add_column :draws, :other_information, :text
  end
end
