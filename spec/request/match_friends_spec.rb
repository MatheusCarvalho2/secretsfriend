require "rails_helper"

RSpec.describe "Draw User", type: :request do
  describe "relacionando sorteio ao usuario" do
    it "com sucesso" do
      user1 = User.create(
        email: "user1@teste.com",
        password: "dkjgn541",
        password_confirmation: "dkjgn541"
      )
      sign_in user1

      user2 = User.create(
      email: "user2@teste.com",
      password: "salfjna",
      password_confirmation: "salfjna"
      )
      sign_in user2

      draw = Draw.create(
        title: "Sorteio da firma",
        min_value: "50,00",
        max_value: "50,00",
        date_draws: "10/06/2024",
        date_present: "15/06/2024",
        description: "O sorteio"
      )

      draw_user = DrawUser.create!(
        owner: true,
        suggestion: " ",
        user: user1,
        draw: draw,
      )

      post "/match_friends", params: {
        draw_user_id: draw_user.id,
        user_id: user1.id,
        id_friends: user2.id
      }
     
      expect(response).to have_http_status(:created)
    end
  end
end
