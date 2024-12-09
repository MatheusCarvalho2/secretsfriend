# frozen_string_literal: true

class Participant < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :draw
  has_many :first_participant, class_name: 'MatchFriend', foreign_key: 'participant1_id', dependent: :destroy
  has_many :second_participant, class_name: 'MatchFriend', foreign_key: 'participant2_id', dependent: :destroy
  has_many :participant_first, through: :first_participant, source: :participant2
  has_many :participant_second, through: :second_participant, source: :participant1
end
