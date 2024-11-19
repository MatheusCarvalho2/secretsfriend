# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController # rubocop:disable Style/Documentation
    include RackSessionsFix
    respond_to :json

    private

    def respond_with(resource, _opts = {}) # rubocop:disable Metrics/MethodLength
      p '++++++++++++++++++++++++++++'
      puts resource.attributes
      p '++++++++++++++++++++++++++++++'
      user_serializer = UserSerializer.new(resource).serializable_hash[:data][:attributes]
      p '------------------------------'
      p user_serializer
      p '------------------------------'
      render json: {
        status: { code: 200, message: 'Logged sucessfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      if request.headers['Authorization'].present?
        p '+++++++++++++++++++++++++++++++++'
        p request.headers['Authorization'].split(' ').last
        p '+++++++++++++++++++++++++++++++++'
        p Rails.application.credentials.jwt[:secret_key]
        p '+++++++++++++++++++++++++++++++++'
        jwt_payload = request.headers['Authorization'].split(' ').last
        # jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
        #                          Rails.application.credentials.jwt[:secret_key]).first
        # current_user = User.find(jwt_payload['sub'])
        current_user = User.where(jti: jwt_payload['sub']).last
      end

      if current_user
        p '+++++++++++++++++++++++++++++++++'
        p current_user
        p '+++++++++++++++++++++++++++++++++'
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
