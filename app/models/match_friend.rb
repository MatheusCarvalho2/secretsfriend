# frozen_string_literal: true

class MatchFriend < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :draw
  has_many :participants
end
