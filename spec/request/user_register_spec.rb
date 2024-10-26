# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Novo usuário', type: :request do
  describe 'usuario faz novo registro' do
    it 'com sucesso' do
      post '/signup', params: {
        "user[email]": 'padawan@email.com',
        "user[password]": '1153123',
        "user[password_confirmation]": '1153123'
      }
      expect(response).to have_http_status(:ok)
    end
    it 'com falha' do
      post '/signup'
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
