# frozen_string_literal: true

class ApplicationController < ActionController::Base # rubocop:disable Style/Documentation
  before_action :set_locale
  skip_before_action :verify_authenticity_token

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
