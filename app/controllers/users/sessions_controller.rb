# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController # rubocop:disable Style/Documentation
    include RackSessionsFix
    respond_to :json

    private

    def respond_with(resource, _opts = {}) # rubocop:disable Metrics/AbcSize
      resource.update!(jti: SecureRandom.uuid)
      Rails.logger.info("Authorization Header: #{request.headers['Authorization']}")
      Rails.logger.info("Resource Attributes: #{resource.attributes}")

      user_serializer = UserSerializer.new(resource).serializable_hash[:data][:attributes]
      Rails.logger.info("Serialized User: #{user_serializer}")

      render json: {
        status: { code: 200, message: 'Logged sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      Rails.logger.info("Authorization Header: #{request.headers['Authorization']}")

      if request.headers['Authorization'].present?
        Rails.logger.info(request.headers['Authorization'].split(' ').last)
        Rails.logger.info(Rails.application.credentials.jwt[:secret_key])
        jwt_payload = JWT.decode(
          request.headers['Authorization'].split(' ').last,
          Rails.application.credentials.jwt[:secret_key],
          true,
          { algorithm: 'HS256' }
        ).first
        current_user = User.find(jwt_payload['sub'])
      end

      if current_user
        Rails.logger.info("current_user: #{current_user}")
        render json: {
          status: 200,
          message: 'Logged out sucessfully.'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end
