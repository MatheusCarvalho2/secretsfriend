# frozen_string_literal: true

class MatchFriendsController < ApplicationController # rubocop:disable Style/Documentation
  def create
    match_friends = MatchFriend.new(
      draw_user_id: params[:draw_user_id],
      user_id: params[:user_id],
      id_friends: params[:id_friends]
    )

    if match_friends.save
      render json: match_friends, status: :created
    else
      render json: match_friends.errors, status: :unprocessable_entity
    end
  end
end
