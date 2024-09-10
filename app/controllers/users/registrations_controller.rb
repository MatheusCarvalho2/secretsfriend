# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController # rubocop:disable Style/Documentation
    include RackSessionsFix
    respond_to :json
    # before_action :skip_session_storage

    private

    # def skip_session_storage
    #   request.session_options[:skip] = true
    # end

    def respond_with(resource, _opts = {}) # rubocop:disable Metrics/MethodLength
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'Signed up sucessfully.' },
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      else
        render json: {
          status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" },
          data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :unprocessable_entity
      end
    end
  end
end
