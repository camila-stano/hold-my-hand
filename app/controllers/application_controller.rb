class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :origin, :photo, :nickname,
                                                       :age, :language, :current_address, :gender, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:age, :language, :current_address, 
                                                              :gender, :photo, :nickname])
  end

  def default_url_options
    {locale: I18n.locale}
  end
  
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale.to_sym : nil
  end
end
