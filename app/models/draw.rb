# frozen_string_literal: true

class Draw < ApplicationRecord # rubocop:disable Style/Documentation
  has_many :draw_users
  has_many :users, through: :draw_users
  has_many :participants, dependent: :destroy
  validates :title, :min_value, :max_value, :date_draws, :date_present, :description, presence: true

  def assign_secret_friends
    p participants

    shuffled_participants = participants.shuffle
    # incluir condição com data para sorteio
    shuffled_participants.each do |participant|
      random_index = (0...(shuffled_participants.length - 1)).to_a.sample
      secret_friend = shuffled_participants[random_index]
      MatchFriend.create(draw_id: id, participant_id: participant.id, id_friends: secret_friend.id)
    end
    secret_friend
  end
end

# cria o draw
# cria o user 1 a user n
# em draw_user vincula draw com user
# draw.assign_secret_friends
# salva em match_friend
