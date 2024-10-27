# frozen_string_literal: true

class ParticipantsController < ApplicationController # rubocop:disable Style/Documentation
  def create
    participant = Participant.new(
      name: params[:name],
      email: params[:email],
      draw_id: params[:draw_id]
    )
    return render json: participant, status: :created if participant.save

    render json: participant.errors, status: :unprocessable_entity
  end
end
