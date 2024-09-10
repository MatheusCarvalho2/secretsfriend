# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_column :users, :name, :string
  end
end
