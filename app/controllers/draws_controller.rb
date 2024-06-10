class DrawsController < ApplicationController
  def create
    p current_user
    draw = Draw.create(title: params[:title], min_value: params[:min_value], max_value: params[:max_value], date_draws: params[:date_draw], date_present: params[:date_present], description: params[:description])
    return render json: draw, status: :created
  end
end