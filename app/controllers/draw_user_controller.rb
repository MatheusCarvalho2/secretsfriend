class DrawUserController < ApplicationController
  def create
    draw_user = DrawUser.create(
      owner: params[:owner], # if para setar o valor
      suggestion: params[:suggestion],
    )
    if draw_user.save
      return render json: draw_user, status: :created
    else
      return render json: draw_user.errors, status: :bad_request
    end
  end
end
