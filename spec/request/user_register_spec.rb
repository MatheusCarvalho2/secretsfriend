# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Padawan', type: :request do
  describe 'usuario faz novo registro' do
    it 'com sucesso' do
      post '/users', params: {
        "user[email]": 'padawan@email.com',
        "user[password]": '1153123',
        "user[password_confirmation]": '1153123'
      }
      expect(response).to have_http_status(:see_other)
    end
    it 'com falha' do
      post '/users'
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
