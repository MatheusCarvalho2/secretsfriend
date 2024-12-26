class ApplicationMailer < ActionMailer::Base # rubocop:disable Style/FrozenStringLiteralComment,Style/Documentation
  default from: 'amigosecretoatelie@gmail.com'
  layout 'mailer'
end
