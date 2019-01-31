class ApplicationController < ActionController::Base

  before_action :set_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? super : { lang: I18n.locale }
  end

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      super
    end
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang])  ? params[:lang] : I18n.default_locale
  end

end
