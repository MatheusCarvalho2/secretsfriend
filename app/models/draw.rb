# frozen_string_literal: true

class Draw < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  has_many :participants
  validates :title, :min_value, :max_value, :date_draws, :date_present, :description, presence: true

  def assign_secret_friends
    p '000000000000000000000000'
    p participants
    p '000000000000000000000000'

    shuffled_participants = participants.shuffle
    # incluir condição com data para sorteio
    shuffled_participants.each do |participant|
      random_index = (0...(shuffled_participants.length - 1)).to_a.sample
      secret_friend = shuffled_participants[random_index]
      MatchFriend.create(draw_id: id, participant1_id: participant.id, participant2_id: secret_friend.id)
    end
  end
end
