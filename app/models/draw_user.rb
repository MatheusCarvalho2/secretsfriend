# frozen_string_literal: true

class DrawUser < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :draw
  belongs_to :user
  validates :owner, presence: true
end
