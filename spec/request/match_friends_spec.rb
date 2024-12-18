# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Salvando amigo secreto em match_fiend', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'Sorteio' do # rubocop:disable Metrics/BlockLength
    it 'com sucesso' do # rubocop:disable Metrics/BlockLength
      user1 = User.create(
        email: 'user@teste.com',
        password: 'dkjgn541',
        password_confirmation: 'dkjgn541'
      )
      sign_in user1

      draw = Draw.create(
        title: 'Sorteio da firma',
        min_value: '50,00',
        max_value: '50,00',
        date_draws: '10/06/2024',
        date_present: '15/06/2024',
        description: 'O sorteio'
      )

      participant1 = Participant.new(
        name: '',
        email: 'participant1@email.com',
        draw:
      )

      participant2 = Participant.new(
        name: '',
        email: 'participant2@email.com',
        draw:
      )

      post "/draws/#{draw.id}", params: {
        'draw_id': draw.id,
        'participant1_id': participant1.id,
        'participant2_id': participant2.id
      }

      expect(response).to have_http_status(:created)
    end
  end
end
