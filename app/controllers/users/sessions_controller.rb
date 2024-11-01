# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController # rubocop:disable Style/Documentation
    include RackSessionsFix
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      puts resource.attributes
      render json: {
        status: { code: 200, message: 'Logged sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      if request.headers['Authorization'].present?
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                                 Rails.application.credentials.jwt[:secret_key]).first
        current_user = User.find(jwt_payload['sub'])
      end

      if current_user
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
