# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Novo sorteio', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'usuario cria novo sorteio' do # rubocop:disable Metrics/BlockLength
    it 'com sucesso' do
      user = User.create(
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
      )
      sign_in user
      post '/draws', params: {
        "title": 'Sorteio da firma',
        "min_value": '50,00',
        "max_value": '50,00',
        "date_draws": '10/06/2024',
        "date_present": '15/06/2024',
        "description": 'O sorteio'
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
      post '/draws', params: {
        "title": nil,
        "min_value": nil,
        "max_value": nil,
        "date_draws": nil,
        "date_present": nil,
        "description": 'O sorteio'
      }
      expect(response).to have_http_status(:bad_request)
    end
  end
end
