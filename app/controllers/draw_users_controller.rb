# frozen_string_literal: true

class DrawUsersController < ApplicationController # rubocop:disable Style/Documentation
  def create
    draw_user = DrawUser.new(
      owner: params[:owner],
      suggestion: params[:suggestion],
      user_id: params[:user_id],
      draw_id: params[:draw_id]
    )
    return render json: draw_user, status: :created if draw_user.save

    render json: draw_user.errors, status: :unprocessable_entity
  end
end
