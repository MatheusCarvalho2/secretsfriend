# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Salvando participantes na tabela', type: :request do # rubocop:disable Metrics/BlockLength
  describe 'usuario cria novo sorteio e salva participantes' do # rubocop:disable Metrics/BlockLength
    it 'com sucesso' do
      User.create(
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
      )

      draw = Draw.create(
        title: 'Sorteio da firma',
        min_value: '50,00',
        max_value: '50,00',
        date_draws: '10/06/2024',
        date_present: '15/06/2024',
        description: 'O sorteio'
      )

      participant = Participant.new(
        name: 'Teste',
        email: 'teste@teste.com',
        draw:
      )

      expect(participant).to be_valid
    end

    it 'com erro' do
      User.create(
        email: 'teste@teste.com',
        password: '123123',
        password_confirmation: '123123'
      )

      Draw.create(
        title: 'Sorteio da firma',
        min_value: '50,00',
        max_value: '50,00',
        date_draws: '10/06/2024',
        date_present: '15/06/2024',
        description: 'O sorteio'
      )
      participant = Participant.new(name: 'John Doe')

      expect(participant).not_to be_valid
    end
  end
end
