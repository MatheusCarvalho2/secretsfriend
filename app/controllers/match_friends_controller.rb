# frozen_string_literal: true

class MatchFriendsController < ApplicationController # rubocop:disable Style/Documentation
  def create
    match_friends = MatchFriend.new(
      draw_id: params[:draw_id],
      participant1_id: params[:participant1_id],
      participant2_id: params[:participant2_id]
    )

    if match_friends.save
      render json: match_friends, status: :created
    else
      render json: match_friends.errors, status: :unprocessable_entity
    end
  end
end
