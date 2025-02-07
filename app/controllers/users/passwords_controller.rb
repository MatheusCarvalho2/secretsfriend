# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController # rubocop:disable Style/Documentation
    def create
      email = params[:user][:email]
      if email.blank?
        render json: { error: 'E-mail não pode ficar em branco' }, status: :unprocessable_entity
        return
      end

      user = User.find_by(email:)
      return render json: { error: 'E-mail não encontrado' }, status: :not_found unless user

      user.send_reset_password_instructions
      render json: { message: 'E-mail de recuperação enviado' }, status: :ok
    end
  end
end
