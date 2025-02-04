class UserMailer < ApplicationMailer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.secret_friend.subject
  #

  layout 'send_secret_friend'

  def format_email(email)
    regex = /^([a-zA-Z]+)(?:\.([a-zA-Z]+))?@.*$/
    match_email = email.match(regex)

    if match_email
      first_name = match_email[1].capitalize
      last_name = match_email[2]&.capitalize
      last_name ? "#{first_name} #{last_name}" : first_name
    else
      email
    end
  end

  def format_date(date)
    regex = /^(\d{4})-(\d{2})-(\d{2}) \d{2}:\d{2}:\d{2} UTC$/
    match_date = date.match(regex)

    if match_date
      day = match_date[3]
      month = match_date[2]
      year = match_date[1]
      "#{day}/#{month}/#{year}"
    else
      date_string
    end
  end

  def format_currency(value)
    regex = /^\d+$/
    match_value = value.to_s.match(regex)

    if match_value
      "R$#{value},00"
    else
      value
    end
  end

  def send_secret_friend(participant1, participant2, draw) # rubocop:disable Metrics/MethodLength
    @greeting = 'Seu amigo secreto chegou'
    @participant1 = participant1
    @participant2 = participant2
    @draw_min_value = format_currency(draw.min_value)
    @draw_max_value = format_currency(draw.max_value)
    @draw_date = format_date(draw.date_present.to_s)
    @participant1_name = format_email(participant1)
    @participant2_name = format_email(participant2)

    mail(
      to: @participant1,
      subject: @greeting,
      template_name: 'send_secret_friend',
      template_path: 'user_mailer'
    )
  end

  def reset_password_instructions(user, token, _opts = {})
    @user = user
    @token = token
    puts '-------------------------'
    puts "Token recebido: #{@token}"

    @url = "http://localhost:3000/password/edit?reset_password_token=#{@token}"

    puts "URL: #{@url}"
    puts '-------------------------'

    Rails.logger.error 'Token de redefinição de senha está NIL!' if @token.nil?

    mail(to: @user.email, subject: 'Redefinição de senha')
  end
end
