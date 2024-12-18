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

      # O operador módulo (%) garante que o cálculo de índice não ultrapasse o tamanho da lista.
      # Quando o índice chega ao fim da lista, ele "volta" para o início.
      # secret_friend = shuffled_participants[(index + 1) % shuffled_participants.size]
      # MatchFriend.create(draw_id: id, participant1_id: participant.id, participant2_id: secret_friend.id)
    end
  end
end
