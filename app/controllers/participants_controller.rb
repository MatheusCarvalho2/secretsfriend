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

  def update
    participant = Participant.find(params[:id])
    if participant.update(participant_params)
      render json: participant, status: :ok
    else
      render json: { errors: participant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    participant = Participant.find(params[:id])
    participant.destroy
    render json: { message: 'Participant deleted successfully' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Participant not found' }, status: :not_found
  rescue StandardError => e
    render json: { error: "Failed to delete participant: #{e.message}" }, status: :unprocessable_entity
  end

  private

  def participant_params
    params.require(:participant).permit(:email)
  end
end
