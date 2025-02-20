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

    def update
      user = User.reset_password_by_token(reset_password_params)

      if user.errors.empty?
        render json: { message: 'Senha redefinida com sucesso!' }, status: :ok
      else
        render json: { error: 'Token inválido ou senha inválida.', details: user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    private

    def reset_password_params
      params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
    end
  end
end
