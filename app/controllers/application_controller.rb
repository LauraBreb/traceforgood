class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.company_id != nil
      static_pages_landing_page_path
    else
      companies_path
      # flash[:notice] = "To complete your registration you first need to join or register a company"
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end
