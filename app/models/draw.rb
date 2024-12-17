# frozen_string_literal: true

class Draw < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  has_many :participants
  validates :title, :min_value, :max_value, :date_draws, :date_present, :description, presence: true

  def assign_secret_friends # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    p "participants: #{participants}"

    shuffled_participants = participants.shuffle
    p "shuffled_participants: #{shuffled_participants}"

    remaining_participants = shuffled_participants.shuffle
    p "remaining_participants: #{remaining_participants}"

    positions = (0...(shuffled_participants.length - 1)).to_a

    shuffled_participants.each do |participant|
      position_ids = (0...(positions.length - 1)).to_a

      current_positions = position_ids.first
      position_ids.shift

      next if participant.id == remaining_participants[current_positions.to_i].id

      MatchFriend.create(draw_id: id, participant1_id: participant.id,
                         participant2_id: remaining_participants[current_positions].id)
    end
  end
end
