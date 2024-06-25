class MatchFriendsController < ApplicationController
  def create
    p "***********na controller****************"
    # match_friends_params = params.require(:match_friends).permit(:draw_user, :user, :secret_friend)
    # p match_friends_params
    # match_friends = MatchFriend.new(match_friends_params)

    match_friends = MatchFriend.new(
      draw_users_id: params[:draw_users_id],
      users_id: params[:users_id],
      id_friends: params[:id_friends]
    )
    p "***********depois do .new****************"
    if match_friends.save
      p match_friends
      p "no if"
      return render json: match_friends, status: :created
    else
      p match_friends
      p "no else"
      return render json: match_friends.errors, status: :unprocessable_entity
    end
  end
end
