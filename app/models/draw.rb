# frozen_string_literal: true

class Draw < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  has_many :participants
  validates :title, :min_value, :max_value, :date_draws, :date_present, :description, presence: true

  def assign_secret_friends # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    return if participants.size < 2

    shuffled_participants = participants.shuffle

    shuffled_participants.each_with_index do |participant, index|
      if index == (shuffled_participants.length - 1)
        MatchFriend.create(draw_id: id, participant1_id: participant.id,
                           participant2_id: shuffled_participants[0].id)
      else
        MatchFriend.create(draw_id: id, participant1_id: participant.id,
                           participant2_id: shuffled_participants[index + 1].id)
      end
    end
  end
end
