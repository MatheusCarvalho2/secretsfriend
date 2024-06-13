class DrawsController < ApplicationController
  def create
    draw = Draw.create(title: params[:title], min_value: params[:min_value], max_value: params[:max_value], date_draws: params[:date_draws], date_present: params[:date_present], description: params[:description])
    if draw.save
      return render json: draw, status: :created
    else
      return render json: draw.errors, status: :bad_request
    end
  end
end