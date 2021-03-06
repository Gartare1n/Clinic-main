class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end

  def current_ability
    @current_ability ||= ::Ability.new((doctor_signed_in?) ? current_doctor : current_patient)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :phone, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :phone, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :phone, :password, :avatar])
  end

end
