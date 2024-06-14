require "rails_helper"

RSpec.describe "Draw User", type: :request do
  describe "relacionando sorteio ao usuario" do
    it "com sucesso" do
      user = User.create( # adicionar nome ao user??
        email: "teste@teste.com",
        password: "123123",
        password_confirmation: "123123"
      )
      sign_in user

      draw = Draw.create(
        title: "Sorteio da firma",
        min_value: "50,00",
        max_value: "50,00",
        date_draws: "10/06/2024",
        date_present: "15/06/2024",
        description: "O sorteio"
      )
      draw.save

      post "/draw_users", params: {
        "owner": true,
        "suggestion": "Text",
      }
      p response
      expect(response).to have_http_status(:created)
    end
  end
end
