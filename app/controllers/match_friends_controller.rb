class MatchFriendsController < ApplicationController
  def create
    match_friends = MatchFriend.new(
      draws: params[:draws],
      user: params[:user],
      secret_friend: params[:secret_friend],
    )
    if match_friends.save
      return render json: match_friends, status: :created
    else
      return render json: match_friends.errors, status: :unprocessable_entity
    end
  end
end
