# frozen_string_literal: true

class DrawsController < ApplicationController # rubocop:disable Style/Documentation
  def create # rubocop:disable Metrics/AbcSize
    draw = Draw.create(
      title: params[:title],
      min_value: params[:min_value],
      max_value: params[:max_value],
      date_draws: params[:date_draws],
      date_present: params[:date_present],
      description: params[:description]
    )
    return render json: draw, status: :created if draw.save

    render json: draw.errors, status: :bad_request
  end
end
