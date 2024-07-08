# frozen_string_literal: true

class AddUserToMatchFriends < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_column :match_friends, :id_friends, :integer
    add_foreign_key :match_friends, :user, column: :id_friends
  end
end
