module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if doctor_signed_in?
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(appointments_path) and return
    elsif patient_signed_in?
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(appointments_path) and return
    end
  end
end