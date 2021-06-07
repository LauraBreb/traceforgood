class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :mobile_phone, :company_name, :company_proof, :company_type, :company_position)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :current_password, :mobile_phone, :company_name, :company_proof, :company_type, :company_position)}
  end
end
