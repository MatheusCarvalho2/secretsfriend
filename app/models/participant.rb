# frozen_string_literal: true

class Participant < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :draw
end
