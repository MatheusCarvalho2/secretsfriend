class DrawUsersController < ApplicationController
  def create
    draw_user = DrawUser.new(
      owner: params[:owner], # if para setar o valor
      suggestion: params[:suggestion],
      user_id: params[:user_id],
      draw_id: params[:draw_id]
    )
    if draw_user.save
      return render json: draw_user, status: :created
    else
      return render json: draw_user.errors, status: :unprocessable_entity
    end
  end
end
