class UserMailer < ApplicationMailer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.secret_friend.subject
  #
  def send_secret_friend(participant1, participant2)
    @greeting = 'Seu amigo secreto chegou'
    @participant1 = participant1
    @participant2 = participant2

    mail(to: @participant1, subject: @participant2)
  end
end
