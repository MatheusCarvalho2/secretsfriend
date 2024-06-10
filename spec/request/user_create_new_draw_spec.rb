require "rails_helper"

RSpec.describe "User creat new draw", type: :request do
  describe "usuario cria novo sorteio" do
    it "Com sucesso" do
      user= User.create(email: "teste@teste.com", password: "123123", password_confirmation: "123123")
      sign_in user
      post "/draws", params: {"title": "Sorteio da firma", "min_value": "50,00", "max_value": "50,00", "date_draw": "10/06/2024", "date_present": "15/06/2024", "description": "O sorteio"}
      expect(response).to have_http_status(:created)
    end
  end
end