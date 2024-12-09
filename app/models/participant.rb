# frozen_string_literal: true

class Participant < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :draw
  belongs_to :participant1, class_name: 'Draw', foreign_key: 'participant1_id'
  belongs_to :participant2, class_name: 'Draw', foreign_key: 'participant2_id'
end
