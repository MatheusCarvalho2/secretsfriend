# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Criando relacionamento entre user e draw_user', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'usuário criando sorteio' do # rubocop:disable Metrics/BlockLength
    it 'com sucesso' do
      user = User.create( # adicionar nome ao user??
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
      )
      sign_in user

      draw = Draw.create(
        title: 'Sorteio da firma',
        min_value: '50,00',
        max_value: '50,00',
        date_draws: '10/06/2024',
        date_present: '15/06/2024',
        description: 'O sorteio'
      )
      draw.save

      post '/draw_users', params: {
        "owner": true,
        "suggestion": 'Text',
        "user_id": user.id,
        "draw_id": draw.id
      }
      expect(response).to have_http_status(:created)
    end

    it 'com erro' do
      user = User.create(
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
      )
      sign_in user

      draw = Draw.create(
        title: nil,
        min_value: '50,00',
        max_value: '50,00',
        date_draws: '10/06/2024',
        date_present: '15/06/2024',
        description: 'O sorteio'
      )
      draw.save

      post '/draw_users', params: {
        "owner": true,
        "suggestion": 'Text',
        "user_id": user.id,
        "draw_id": draw.id
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
