# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'secret_friend' do
    let(:mail) { UserMailer.secret_friend }

    it 'renders the headers' do
      expect(mail.subject).to eq('Secret friend')
      expect(mail.to).to eq(['bruna@webgoal.com.br'])
      expect(mail.from).to eq(['amigosecretoatelie@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
